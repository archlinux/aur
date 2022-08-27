# Maintainer: Andrew Rembrandt <andrew@rembrandt.dev>

pkgname=plainmail2html-git
_pkgname=plainmail2html
pkgver=r28.3da0335
pkgrel=1
pkgdesc="Mutt utility to send HTML formatted Emails"
arch=(any)
url="https://github.com/amitramon/plainMail2HTML"
license=('GPL')
depends=("python-docutils")
provides=("$_pkgname")
source=("git+https://github.com/amitramon/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  find . -type f -not -path '*/.*' -not -path './bin/*' -exec sh -c \
    'install -m 644 -D "$0" '"$pkgdir"'/usr/share/'"${_pkgname}"'${0:1}' {} \;
  find ./bin -type f -exec sh -c \
    'install -m 755 -D "$0" '"$pkgdir"'/usr/share/'"${_pkgname}"'${0:1}' {} \;

  mkdir "$pkgdir/usr/bin"
  cd "$pkgdir"
  find "/usr/share/${_pkgname}/bin/" -type f -exec sh -c \
    'ln -s "${0}" '"$pkgdir"'/usr/bin/$(basename ${0})' {} \;
}
