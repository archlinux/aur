# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='ovirt-engine-cli'
pkgver='3.6.9.3'
pkgrel='2'
pkgdesc='oVirt Engine Command Line Interface'
arch=('any')
url="http://ovirt.org/develop/release-management/features/infra/cli"
depends=('python2' 'python2-setuptools' 'python2-ply' 'python2-kitchen' 'python2-ovirt-engine-sdk')
optdepends=('virt-viewer: SPICE and VNC remote console support')
makedepends=('python2' 'python2-setuptools' 'python2-ply' 'python2-kitchen')
license=('ASL 2.0')
source=("http://resources.ovirt.org/pub/ovirt-master-snapshot/src/${pkgname}/${pkgname}-${pkgver}.tar.gz"
	"add_password_option.patch")
sha256sums=('c53b213379051a4370ea37b89acef8b9378d62f834ae283a24bbd8179cb330c6'
            'a973931155cefd35ad5686b0a6cfe3ae595c2bfbb8ecaa152790b10966013370')

prepare() {
  # This patch add 'password' run option, disabled by default.
  # Use it if you really need it.
  
  cd "${srcdir}/${pkgname}/src/ovirtcli/infrastructure"
  #patch -p0 -i "${srcdir}/add_password_option.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py install -O1 --skip-build --root="${pkgdir}"
}
