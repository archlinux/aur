pkgname=idimitrov-dwm-git
_pkgname=dwm
pkgver=6.3.r0.d39e2f34
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=('noto-fonts' 'ttf-nerd-fonts-symbols-mono' 'libx11' 'libxinerama' 'libxft' 'xorg-xinit' 'xf86-video-vesa' 'xorg-bdftopcf' 'xorg-font-util' 'xorg-fonts-encodings' 'xorg-iceauth' 'xorg-mkfontscale' 'xorg-server' 'xorg-server-common' 'xorg-server-devel' 'xorg-server-xephyr' 'xorg-server-xnest' 'xorg-server-xvfb' 'xorg-sessreg' 'xorg-setxkbmap' 'xorg-xauth' 'xorg-xcursorgen' 'xorg-xdpyinfo' 'xorg-xev' 'xorg-xhost' 'xorg-xkbcomp' 'xorg-xkill' 'xorg-xmodmap' 'xorg-xprop' 'xorg-xrandr' 'xorg-xrdb' 'xorg-xrefresh' 'xorg-xset' 'xorg-xsetroot' 'xorg-xwayland' 'xorg-xwininfo' 'xorg-xinput' 'xf86-video-vesa' 'xorg-bdftopcf' 'xorg-docs' 'xorg-font-util' 'xorg-fonts-100dpi' 'xorg-fonts-75dpi' 'xorg-fonts-encodings' 'xorg-iceauth' 'xorg-mkfontscale' 'xorg-server' 'xorg-server-common' 'xorg-server-devel' 'xorg-server-xephyr' 'xorg-server-xnest' 'xorg-server-xvfb' 'xorg-sessreg' 'xorg-setxkbmap' 'xorg-smproxy' 'xorg-x11perf' 'xorg-xauth' 'xorg-xbacklight' 'xorg-xcmsdb' 'xorg-xcursorgen' 'xorg-xdpyinfo' 'xorg-xdriinfo' 'xorg-xev' 'xorg-xgamma' 'xorg-xhost' 'xorg-xinput' 'xorg-xkbcomp' 'xorg-xkbevd' 'xorg-xkbutils' 'xorg-xkill' 'xorg-xlsatoms' 'xorg-xlsclients' 'xorg-xmodmap' 'xorg-xpr' 'xorg-xprop' 'xorg-xrandr' 'xorg-xrdb' 'xorg-xrefresh' 'xorg-xset' 'xorg-xsetroot' 'xorg-xvinfo' 'xorg-xwayland' 'xorg-xwd' 'xorg-xwininfo' 'xorg-xwud')
makedepends=('git')
install=dwm.install
provides=('dwm')
conflicts=('dwm')
source=(dwm.desktop
        "$_pkgname::git+http://gitlab.com/ivandimitrov8080/dwm"
        config.h)
sha256sums=('bc36426772e1471d6dd8c8aed91f288e16949e3463a9933fee6390ee0ccd3f81'
            'SKIP'
            'SKIP')

pkgver(){
  cd $_pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  if [[ -f "$srcdir/config.h" ]]; then
    cp -fv "$srcdir/config.h" config.h
  fi
}

build() {
  cd $_pkgname
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
  install -m644 -D ../dwm.desktop "$pkgdir/usr/share/xsessions/dwm.desktop"
}

# vim:set ts=2 sw=2 et:
