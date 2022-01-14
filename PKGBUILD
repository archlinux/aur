# Contributor: Ivan Zenin <i.zenin@gmx.com>

pkgname=urxvt-url-picker-git
pkgver=latest
pkgrel=2
pkgdesc='Perl extension for rxvt-unicode (aka urxvt) to enable quick keyboard navigation of URLs shown in the terminal window'
arch=('any')
url='https://github.com/quite/urlpicker'
license=('GPL3')
depends=('rxvt-unicode' 'perl')
provides=('urxvt-url-picker')
source=("git+https://github.com/quite/urlpicker.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/urlpicker
  ( set -o pipefail
    git describe --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}"/urlpicker
  install -dm755 "$pkgdir"/usr/lib/urxvt/perl
  install -m644 -t "$pkgdir"/usr/lib/urxvt/perl url-picker
}
