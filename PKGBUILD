# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=kweb
pkgver=1.7.9
pkgrel=1
pkgdesc="Raspberry pi web browser and omxplayergui."
arch=('armv6h' 'armv7h' 'aarch64')
url="https://www.raspberrypi.org/forums/viewtopic.php?t=40860"
license=('GPL')
install=$pkgname.install
makedepends=('nuitka')
depends=(
  'webkitgtk'
  'webkitgtk2'
  'omxplayer-git'
  'youtube-dl'
  'xpdf'
  'wget'
  'xterm'
  'python2'
)
optdepends=(
  'tint2: task bar if you want to use kweb as desktop replacement'
  'evince: better PDF support'
  'uget: GUI based download manager'
)
provides=('omxplayergui')
source=("http://steinerdatenbank.de/software/kweb-${pkgver}-src.tar.gz")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"
  make clean
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"

  # build kweb
  echo "Building kweb..."
  make kweb
  make kweb3

  # build omxplayergui
  echo "Building omxplayergui..."
  cd omxplayerguibin
  nuitka --python-version=2.7 omxplayergui.py
  chmod a+x omxplayergui.exe
  cp omxplayergui.exe ../omxplayergui
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  mkdir -p "${pkgdir}/usr/local/bin"

  install -g uucp kweb "${pkgdir}/usr/bin"
  install -g uucp kweb3 "${pkgdir}/usr/bin"
  cp kweb.desktop "${pkgdir}/usr/share/applications"
  cp kweb3.desktop "${pkgdir}/usr/share/applications"
  cp minimalkioskbrowser.png "${pkgdir}/usr/share/pixmaps"
  cp kweb.1.gz "${pkgdir}/usr/share/man/man1"
  cp kwebhelper.py "${pkgdir}/usr/local/bin"
  cp kwebhelper_settings.py "${pkgdir}/usr/local/bin"
  cp kwebhelper_set.py "${pkgdir}/usr/local/bin"
  cp check.py "${pkgdir}/usr/local/bin/kwebcheck.py"
  cp preparekweb "${pkgdir}/usr/local/bin"
  cp omxplayergui "${pkgdir}/usr/local/bin"
  cp dbuscontrolm.sh "${pkgdir}/usr/local/bin"
  cp ginstall-ytdl "${pkgdir}/usr/local/bin"
  cp update-ytdl "${pkgdir}/usr/local/bin"
  cp makebin-ytdl "${pkgdir}/usr/local/bin"
  cp kweb_bookmark.py "${pkgdir}/usr/local/bin"
  cp kweb_edit.py "${pkgdir}/usr/local/bin"
  cp ytdl_server.py "${pkgdir}/usr/local/bin"
  cp bgstart_ytdl_server.sh "${pkgdir}/usr/local/bin"
  mkdir -p "${pkgdir}/usr/local/share/kweb"
  cp about.css "${pkgdir}/usr/local/share/kweb"
  cp about.css "${pkgdir}/usr/local/share/kweb/white.css"
  cp black.css "${pkgdir}/usr/local/share/kweb"
  cp grey.css "${pkgdir}/usr/local/share/kweb"
  cp color.css "${pkgdir}/usr/local/share/kweb"
  cp player1.css "${pkgdir}/usr/local/share/kweb"
  cp player2.css "${pkgdir}/usr/local/share/kweb"
  cp player3.css "${pkgdir}/usr/local/share/kweb"
  cp player4.css "${pkgdir}/usr/local/share/kweb"
  cp player5.css "${pkgdir}/usr/local/share/kweb"
  cp kweb_about_p.html "${pkgdir}/usr/local/share/kweb"
  cp kweb_about_p.html "${pkgdir}/usr/local/share/kweb"
  cp kweb_about_o.html "${pkgdir}/usr/local/share/kweb"
  cp kweb_about_k.html "${pkgdir}/usr/local/share/kweb"
  cp kweb_about_m.html "${pkgdir}/usr/local/share/kweb"
  cp kweb_about_c.html "${pkgdir}/usr/local/share/kweb"
  cp load_config.html "${pkgdir}/usr/local/share/kweb"
  cp nogui.preset "${pkgdir}/usr/local/share/kweb"
  cp trueaspect.preset "${pkgdir}/usr/local/share/kweb"
  cp analogaudio.preset "${pkgdir}/usr/local/share/kweb"
  cp overlay.preset "${pkgdir}/usr/local/share/kweb"
  cp webplayer.preset "${pkgdir}/usr/local/share/kweb"
  cp remoteplayer.preset "${pkgdir}/usr/local/share/kweb"
  cp kwebhelper_settings.py "${pkgdir}/usr/local/share/kweb/default.preset"
  cp ktop "${pkgdir}/usr/local/share/kweb"
  cp kweb_manual.pdf "${pkgdir}/usr/local/share/kweb"
  cp omxplayerGUI_manual.pdf "${pkgdir}/usr/local/share/kweb"
  cp kweb_changelog.html "${pkgdir}/usr/local/share/kweb"
  cp empty.html "${pkgdir}/usr/local/share/kweb"
  cp buttons_template.html "${pkgdir}/usr/local/share/kweb"
  cp desktop.txt "${pkgdir}/usr/local/share/kweb"
  cp LICENSE "${pkgdir}/usr/local/share/kweb"
  cp omxplayergui.png "${pkgdir}/usr/share/pixmaps"
  cp omxplayergui.desktop "${pkgdir}/usr/share/applications"

  sed -i "s|'/usr/|'${pkgdir}/usr/|g" kwebhelper_set.py

  python2 kwebhelper_set.py
}
