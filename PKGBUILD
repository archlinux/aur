# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=getmail6-git
_name="${pkgname%-git}"

epoch=1
pkgver() { git -C "$_name" describe --long | sed 's/^v//;s/-/.r/;s/-g/./'; }
pkgver=6.18.5.r20.8c1f340
pkgrel=1

pkgdesc='POP3 mail retriever with reliable Maildir and command delivery; Python 3 port'
arch=('any')
url="https://$_name.org"
license=('GPL2')

provides=("getmail=$pkgver" "$_name")
conflicts=('getmail')

makedepends=('git' 'python-setuptools')
depends=('python-chardet')
optdepends=('python-keyring: secure password store'
            'python-keyrings-alt: alternative backends')

changelog=CHANGELOG
source=("git+https://github.com/$_name/$_name.git")
b2sums=('SKIP')


build() {
  cd "$_name"
  python setup.py build
}

package() {
  cd "$_name"
  PYTHONHASHSEED=0 python setup.py install --skip-build --optimize=1 --root="$pkgdir"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
