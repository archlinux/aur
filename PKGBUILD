# Maintainer: Konstantin Shalygin <k0ste@cn.ru>

pkgname='ovirt-engine-cli'
pkgver='4.0.0.0'
pkgrel='6'
pkgdesc='oVirt Engine Command Line Interface'
arch=('any')
url='http://www.ovirt.org/CLI'
depends=('python2' 'python2-setuptools' 'python2-ply' 'python2-kitchen' 'ovirt-engine-sdk-python')
optdepends=('virt-viewer: SPICE and VNC remote console support')
makedepends=('python2' 'python2-setuptools' 'python2-ply' 'python2-kitchen')
license=('ASL 2.0')
source=("http://resources.ovirt.org/pub/ovirt-master-snapshot/src/${pkgname}/${pkgname}-${pkgver}.tar.gz"
	"add_password_option.patch")
sha256sums=('2808a725af78c2a10760fb92eb3e5fea0b8925a4849b5f2ee305ea6217b2bf3f'
            'a973931155cefd35ad5686b0a6cfe3ae595c2bfbb8ecaa152790b10966013370')

prepare() {
  pushd "${srcdir}/${pkgname}/src/ovirtcli/infrastructure"
  patch -p0 -i "../../../../add_password_option.patch"
  popd
}

build() {
  pushd "${srcdir}/${pkgname}"
  python2 setup.py build
  popd
}

package() {
  pushd "${srcdir}/${pkgname}"
  python2 setup.py install -O1 --skip-build --root ${pkgdir}
  popd
}
