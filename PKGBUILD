# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: rtfreedman  <rob<d0t>til<d0t>freedman< T>googlemail<d0t>com>
# Contributor: Pyro Devil <p.devil@gmail.com>
pkgname=exfat-dkms-git
_gitname=exfat-git
pkgver=145.a858df5
pkgrel=1 
pkgdesc='Native (nofuse) kernel module for EXtendedFAT support - use with DKMS'
url="https://github.com/dorimanx/exfat-nofuse"
arch=('any')
license=('GPL2')
depends=('dkms')
makedepends=('git')
options=('!strip')
conflicts=('exfat' 'exfat-git')
install="${pkgname}.install"
source=("${_gitname}::git+https://github.com/dorimanx/exfat-nofuse.git"
        "dkms.conf")
md5sums=('SKIP'
         'bbe96b22dbf7103360fe9598394039fa')
 
pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  rm -fr ${_gitname}/{.git,.gitignore}

  mkdir -p "$pkgdir"/usr/src
  cp -r ${_gitname} "$pkgdir"/usr/src/exfat-${pkgver}
  
  # update PACKAGE_VERSION to pkgver
  cat dkms.conf | sed "s/PACKAGE_VERSION=\"[-._ 0-9a-zA-Z]*\"/PACKAGE_VERSION=\"${pkgver}\"/g" \
	>"$pkgdir"/usr/src/exfat-${pkgver}/dkms.conf
}
