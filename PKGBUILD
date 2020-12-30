# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tofe <chris.chapuis@gmail.com>
# Contributor: zhuqin <zhuqin83@gmail.com>
# Contributor: tri1976 <trile7@gmail.com>
# Contributor: snoopy33 <snoopy33@no-log.org>

pkgname=cairo-dock-plug-ins-git
pkgver=3.4.1.r27.a0d3415c2
pkgrel=1
pkgdesc='Plugins for Cairo-Dock'
arch=('i686' 'x86_64')
url='https://glx-dock.org'
license=('GPL')
depends=('cairo-dock' 'libindicator-gtk3' 'libdbusmenu-gtk3') 
makedepends=('alsa-lib' 'cmake' 'dbus-sharp-glib' 'fftw' 'git' 'gnome-menus'
             'gtk-sharp-3' 'gvfs' 'libetpan' 'libexif' 'libical' 'libpulse'
             'libxklavier' 'lm_sensors' 'python' 'python2' 'ruby' 'upower'
             'vala' 'vte3' 'zeitgeist')
optdepends=('alsa-lib: Sound Control, Sound Effects applets'
            'dbus-sharp-glib: Mono API'
            'fftw: Impulse applet'
            'gnome-menus: Applications Menu applet'
            'gtk-sharp-3: Mono API'
            'gvfs: GVFS integration'
            'libetpan: Mail applet'
            'libexif: Slider applet'
            'libical: Clock applet'
            'libpulse: Impulse applet'
            'libxklavier: Keyboard Indicator applet'
            'lm_sensors: System Monitor applet'
            'python: Python 3 API'
            'python2: Python 2 API'
            'ruby: Ruby API'
            'upower: Power Manager applet'
            'vte3: Terminal applet'
            'wireless_tools: Wifi applet'
            'zeitgeist: Recent Events applet')
provides=('cairo-dock-plug-ins')
conflicts=('cairo-dock-plug-ins')
source=('git+https://github.com/Cairo-Dock/cairo-dock-plug-ins.git')
sha256sums=('SKIP')

pkgver() {
  cd cairo-dock-plug-ins

   _tag='3.4.1'
  echo "${_tag}.r$(git rev-list --count ${_tag}..HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd cairo-dock-plug-ins

  sed 's/gmcs/mcs/' -i CMakeLists.txt

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd cairo-dock-plug-ins/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd cairo-dock-plug-ins/build

  make DESTDIR="${pkgdir}" install
}
