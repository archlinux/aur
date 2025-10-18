# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
# Maintainer: tee < teeaur at duck dot com >
pkgname=ecode-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="Lightweight multi-platform code editor designed for modern hardware with a focus on responsiveness and performance."
url="https://github.com/SpartanJ/ecode"
license=('MIT')
arch=('x86_64')
depends=(gcc-libs libglvnd sdl2 bash glibc libelf)
provides=(ecode)
source=(https://raw.githubusercontent.com/SpartanJ/ecode/main/LICENSE ecode.sh)
source_x86_64=("$url/releases/download/ecode-$pkgver/ecode-linux-$pkgver-$arch.tar.gz")
sha256sums=('edb1348f5c3ceca72e9e98c282bfa70ebded0266a75e71def2ea13e932a54913'
            '40460ea0c5d9c523274b53cf41e642bf6ed36406c14f6ce95a33e42e68c71923')
sha256sums_x86_64=('20c205ca61a8af4582253bc2c14284f025860f02f8994abfed86e07f46408621')

package() {
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm755 ecode.sh "$pkgdir"/usr/bin/ecode
  install -Dm644 "$srcdir"/ecode/ecode.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/ecode/ecode.png -t "$pkgdir"/usr/share/pixmaps/
  rm "$srcdir"/ecode/ecode.desktop
  rm "$srcdir"/ecode/ecode.png
  # The libs and assets path are fixed, so I put them in /opt/
  install -d "$pkgdir"/opt/$pkgname/
  cp -av ecode/* "$pkgdir"/opt/$pkgname/
}

# vim: ts=2 sw=2 et:
