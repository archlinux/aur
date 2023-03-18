# Maintainer: RRRRRm <isxiongzj@gmail.com>
pkgname=typing-tempo
pkgver=0.4.4
pkgrel=1
pkgdesc="Typing Tempo is a 41-key 2D typing rhythm game currently in development, available for Windows and Linux."
arch=('i686' 'x86_64')
url="https://rainbeatgames.itch.io/typing-tempo"
source=("file://$HOME/Downloads/typing-tempo-${pkgver}-linux.zip" 
"typing-tempo.desktop")
md5sums=('SKIP' 'SKIP')

package() {
  install -dm755 "$pkgdir/opt/typing-tempo"

  cp -r "$srcdir/typing-tempo-${pkgver}-linux/"* "$pkgdir/opt/typing-tempo"

	cd "$pkgdir/opt/typing-tempo"

	chmod +x "./typing-tempo.sh"
  sed -i '1a cd /opt/typing-tempo' "./typing-tempo.sh"
  ln -s "libSDL3.so.0.0.0" "libSDL3.so.0"
  ln -s "libSDL3_ttf.so.0.0.0" "libSDL3_ttf.so.0"
  ln -s "libSDL3_image.so.0.0.0" "libSDL3_image.so.0"

	mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/typing-tempo/typing-tempo.sh" "$pkgdir"/usr/bin/typing-tempo

	install -Dm644 "$srcdir/typing-tempo.desktop" "$pkgdir/usr/share/applications/typing-tempo.desktop"
}
