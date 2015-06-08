# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tofe <chris.chapuis@gmail.com>
# Contributor: zhuqin <zhuqin83@gmail.com>
# Contributor: tri1976 <trile7@gmail.com>
# Contributor: snoopy33 <snoopy33@no-log.org>

pkgname=cairo-dock-plug-ins-git
pkgver=3.4.1.r7.88ae103
pkgrel=1
pkgdesc='Plugins for Cairo-Dock'
arch=('i686' 'x86_64')
url='http://glx-dock.org'
license=('GPL')
depends=('cairo-dock')
makedepends=('alsa-lib' 'cmake' 'dbus-sharp-glib' 'fftw' 'gnome-menus'
             'gtk-sharp-3' 'gvfs' 'libetpan' 'libexif' 'libical' 'libpulse'
             'libxklavier' 'lm_sensors' 'python' 'python2' 'ruby' 'upower'
             'vala' 'vte3' 'webkitgtk' 'zeitgeist')
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
            'webkitgtk: Weblets applet'
            'zeitgeist: Recent Events applet')
replaces=('cairo-dock-plugins-git')
provides=('cairo-dock-plug-ins')
conflicts=('cairo-dock-plug-ins')
source=('git+https://github.com/Cairo-Dock/cairo-dock-plug-ins.git'
        'cairo-dock-plug-ins-mono.patch')
sha256sums=('SKIP'
            '91a32a93e27f4600c5aee0b6e7b4c7d8cc6711a40ac5d185021e616cf5d1bdb7')

pkgver() {
  cd cairo-dock-plug-ins

  _tag='3.4.1'
  echo "${_tag}.r$(git rev-list --count ${_tag}..HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd cairo-dock-plug-ins

  patch -Np1 -i ../cairo-dock-plug-ins-mono.patch
}

build() {
  cd cairo-dock-plug-ins

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd cairo-dock-plug-ins/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
