# Maintainer:  Alexander Rødseth <rodseth@gmail.com>
# Maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>

pkgname=midori
pkgver=0.5.4
pkgrel=2
pkgdesc='Lightweight web browser based on Gtk WebKit'
arch=('x86_64' 'i686')
url='http://www.midori-browser.org/'
license=('LGPL2.1')
install='midori.install'
depends=('libzeitgeist' 'webkitgtk3' 'libnotify' 'libxss' 'hicolor-icon-theme' 'desktop-file-utils' 'libunique3' 'gcr') # 'granite'
makedepends=('pkg-config' 'bzr' 'python2' 'libxml2' 'gtk3' 'intltool' 'python2-docutils' 'libsoup' 'vala' 'librsvg')
optdepends=('gstreamer0.10-ugly-plugins: HTML5 videos support'
            'aria2: download utility')
            #'steadyflow: download manager')
options=('!emptydirs')
source=("http://www.midori-browser.org/downloads/${pkgname}_${pkgver}_all_.tar.bz2")
sha256sums=('d4ee77f3dd9bf2c07cea7674d533e77960e9346bd8b5482582ccb3cdaf182022')

build() {
  cd "$srcdir/${pkgname}_${pkgver}_all_"

  python2 ./waf configure \
    --prefix=/usr \
    --enable-gtk3 \
    --disable-granite
    #--enable-webkit2
  python2 ./waf build 
}

package() {
  cd "$srcdir/${pkgname}_${pkgver}_all_"

  DESTDIR="$pkgdir" python2 ./waf install
}

# vim:set ts=2 sw=2 et:
