# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tofe <chris.chapuis@gmail.com>
# Contributor: zhuqin <zhuqin83@gmail.com>
# Contributor: tri1976 <trile7@gmail.com>
# Contributor: snoopy33 <snoopy33@no-log.org>

pkgname=cairo-dock-plug-ins-git
pkgver=3.4.1.r19.02ad3401d
pkgrel=1
pkgdesc='Plugins for Cairo-Dock'
arch=('i686' 'x86_64')
url='https://glx-dock.org'
license=('GPL')
depends=('cairo-dock')
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
replaces=('cairo-dock-plugins-git')
provides=('cairo-dock-plug-ins')
conflicts=('cairo-dock-plug-ins')
source=('git+https://github.com/Cairo-Dock/cairo-dock-plug-ins.git')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/cairo-dock-plug-ins

   _tag='3.4.1'
  echo "${_tag}.r$(git rev-list --count ${_tag}..HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/cairo-dock-plug-ins

  sed 's/gmcs/mcs/' -i CMakeLists.txt

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd $srcdir/cairo-dock-plug-ins/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd $srcdir/cairo-dock-plug-ins/build

  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/usr/lib/{cli,mono}

}

# vim: ts=2 sw=2 et:
