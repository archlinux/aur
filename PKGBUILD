pkgname=rtl8723de-dkms-git
_pkgbase=${pkgname%-*-*}
pkgver="7b7fc22"
package_version="5.1.1.8_21285.20171026_COEX20170111-1414"
pkgrel=1
pkgdesc="RTL8723 wireless + bluetooth modules (DKMS)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/smlinux/rtl8723de"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}")

source=("git+${url}" 
        "dkms.conf")

md5sums=('SKIP'
         '149b43b00951200ae252dc586ef4913e')

build() {
  cd ${_pkgbase}
}

package() {
  install -dm 755 "${pkgdir}/usr/src/"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgbase}/" "${pkgdir}/usr/src/${_pkgbase}-${package_version}"

  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${package_version}/dkms.conf"

  # Set name and version
  sed -e "s/@PKGVER@/${package_version}/" \
          -i "${pkgdir}"/usr/src/${_pkgbase}-${package_version}/dkms.conf

}
