# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor :  Aleksander Mietinen <aleksander at mietinen dot net>


pkgname=linenum-git
_name="${pkgname%-git}"

pkgver() {
  cd "$_name"
  printf %s.r%s "$(grep -m1 ^version= LinEnum.sh | grep -o '[0-9.]\+')" \
                "$(git rev-list --count HEAD)"
}
pkgver=0.982.r75
pkgrel=2

pkgdesc='Scripted local Linux enumeration & privilege escalation checks'
url="https://github.com/rebootuser/$_name"
arch=('any')
license=('MIT')

makedepends=('git')
depends=('bash')

changelog=CHANGELOG.md
source=("$_name::git+$url.git")
sha256sums=('SKIP')


prepare() { sed -i "s|\(\./\)\?LinEnum\(\.sh\)\?|$_name|" "$_name/LinEnum.sh"; }

package() {
  cd "$_name"
  install -Dm755 LinEnum.sh "$pkgdir/usr/bin/$_name"
  install -Dm644 *.md     -t"$pkgdir/usr/share/doc/$_name/"
  install -Dm644 LICENSE  -t"$pkgdir/usr/share/licenses/$_name/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
