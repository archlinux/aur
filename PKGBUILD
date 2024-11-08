# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=freshrss-extensions-git
pkgver=r136.7af45f2
pkgrel=1
pkgdesc='all the official FreshRSS extensions'
arch=('any')
url='https://github.com/FreshRSS/Extensions'
license=('AGPL')
depends=('freshrss')
makedepends=('git')
source=("git+https://github.com/FreshRSS/Extensions.git")
sha256sums=('SKIP')


pkgver(){
  cd "Extensions"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )


}


package() {
  cd "${srcdir}/Extensions"
  install -d "${pkgdir}/usr/share/webapps/freshrss/extensions"

  for extension in xExtension-* ; do
    cp -r $extension "${pkgdir}"/usr/share/webapps/freshrss/extensions/
  done

}

# vim:set ts=2 sw=2 et:
