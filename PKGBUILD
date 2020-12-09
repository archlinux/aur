# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=getmail6-git
_pkgname="${pkgname%-git}"

epoch=1
pkgver() {
  cd "$_pkgname"
  printf '%s.r%s.%s' \
    "$(git tag -l | sed -r 's/v?([0-9\.]+)(-.+)?/\1/g' | sort -Vr | sed 1q)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=6.11.r435.4699143
pkgrel=1

pkgdesc='POP3 mail retriever with reliable Maildir and command delivery; Python 3 port'
arch=('any')
url="http://$_pkgname.org"
license=('GPL2')

provides=("getmail=$pkgver" "${pkgname%-git}")
conflicts=('getmail')

makedepends=('git')
depends=('python-chardet')
optdepends=('python-keyring: secure password store'
            'python-keyrings-alt: alternative backends')

changelog=CHANGELOG
source=("git+https://github.com/$_pkgname/$_pkgname.git")
b2sums=('SKIP')


build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
