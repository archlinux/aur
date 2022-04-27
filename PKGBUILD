# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor : ans <oscarlatorre(at)pm(dot)me>


pkgname=stegsnow-git
_name="${pkgname%-git}"

pkgver() { git -C "$_name" log -n1 --format=%cs.g%h | tr - .; }
pkgver=2020.04.07.g69c5029
pkgrel=1

pkgdesc='Conceal messages in ASCII text by appending whitespace to the end of lines'
url="http://www.darkside.com.au/${_name#steg}"
arch=('x86_64')
license=('Apache')

makedepends=('git')
depends=('glibc')

changelog=ChangeLog
source=("git+https://salsa.debian.org/pkg-security-team/$_name.git" "$_name.patch")
sha256sums=('SKIP' 'd27d97a950a99f649b705d03ef334fa33bfb76280cb6fcf21a73ad4c0fdcaafc')


prepare() {
  cd "$_name"
  patch -Np1 -i "../$_name.patch"
}

build() {
  cd "$_name"
  make
}

package() {
  cd "$_name"
  install -Dm755 "$_name"   -t"$pkgdir/usr/bin/"
  install -Dm644 "$_name.1" -t"$pkgdir/usr/share/man/man1/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
