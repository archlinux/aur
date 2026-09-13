# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>
# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=eclipse-java-bin
_pkgname=${pkgname%-bin}
epoch=2
pkgver=4.41
pkgrel=1
_release=2026-09/R
pkgdesc="Highly extensible IDE (Java version)"
arch=('x86_64' 'aarch64')
url="https://www.eclipse.org/"
license=('EPL')
depends=('java-environment>=21'
         'unzip'
         'webkit2gtk-4.1')
provides=(eclipse=$pkgver-$pkgrel)
conflicts=(eclipse)
options=(!strip)

_srcfilename_x86_64="$_pkgname-${_release//\//-}-linux-gtk-x86_64.tar.gz"
_srcfilename_aarch64="$_pkgname-${_release//\//-}-linux-gtk-aarch64.tar.gz"

source_x86_64=("$_srcfilename_x86_64::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename_x86_64&r=1")
source_aarch64=("$_srcfilename_aarch64::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename_aarch64&r=1")

sha512sums=('676d79e18ef847fc27efc68d85e5f3c3af3eaaa9946acc98161998a3a0771d2a72c7197bdb6d8c180e1b59c2a0bb591150d15114b416c1a0a0f5dbdb06bdb13e')
sha512sums_x86_64=('483af23506520a37e96857dbafc74e36194152b10471c558b1c2a31b34053f5f20af4a5d88509acb7cfa38bd2aff3fa7e6e45159ff827260cdf8838c46bd73a4')
sha512sums_aarch64=('c95453e0170efff6294a746b53e2f83f857aeb2309dbc20b933de18664f7d7e717f071a08a96d46797c2191014e1c8505da8370e45fff83a91396636d29a3091')

source=("eclipse.desktop")

#backup=('usr/lib/eclipse/eclipse.ini')

package() {
  install -d "${pkgdir}/usr/lib"
  cp -r "eclipse" "${pkgdir}/usr/lib/eclipse"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/eclipse/eclipse" "${pkgdir}/usr/bin/eclipse"

  install -Dm0644 "eclipse.desktop" "${pkgdir}/usr/share/applications/eclipse.desktop"

  for i in 16 22 24 32 48 64 128 256 512 1024 ; do
      install -Dm0644 eclipse/plugins/org.eclipse.platform_${pkgver}*/eclipse$i.png \
          "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/eclipse.png"
  done
}
