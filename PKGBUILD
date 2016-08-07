# Maintainer: Miloš Polakovič (milos@mailbox.org)

pkgname=mrdux-git
pkgver=0.2.r0.g07f409d
pkgrel=1
pkgdesc="A desktop environment focused on productivity, speed and aesthetics"
url="https://gitlab.com/mrduX/mrduX"
license=('GPL3')

arch=('any')
makedepends=(sh 'git')
depends=(
   # X Window System and related tools
   'xorg-server' 'xorg-xinit' 'xorg-xsetroot' 'xorg-xmessage' 'xorg-xrandr'
   'xscreensaver' 'xf86-video-vesa'
   # Window manager (xmonad) and status bar (xmobar)
   'xmonad' 'xmonad-contrib' 'xmobar-alsa'
   # Application launchers and terminal emulators
   'dmenu' 'gmrun' 'xterm' 'rxvt-unicode'
   # Command-line utilities
   'alsa-utils' 'sl'
   # Fonts used throughout the graphical environment
   'ttf-envy-code-r' 'ttf-hack' 'ttf-google-fonts-git' 'ttf-webhostinghub-glyphs'
   # Theme resources (custom cursor, icon set and GTK theme)
   'xcursor-pixelfun' 'paper-icon-theme-git' 'adapta-gtk-theme'
   # Python dependencies for the mXinstall tool
   'python' 'python-yaml' 'python-click'
)
optdepends=(
   'xorg-xbacklight: Adjust screen backlight with M-<Up> and M-<Down>'
   'redshift-adjust: Adjust screen temperature with M-<Left> and M-<Right>'
   'shutter: Take a screenshot with M-<Print>'
   'netmenu: Switch netctl active network profile with M-S-n'
   'wavemon: Show wireless network monitor scratchpad with M1-C-<Home>'
   'htop: Show interactive process viewer scratchpad with M1-C-<Delete>'
   'vtop: Show interactive system monitor scratchpad with M1-C-<Insert>'
   'terminology: Start a fancy EFL-based terminal emulator with M-S-M1-<Return>'
   'feh: Set desktop wallpaper on the command-line with "feh --bg-fill <file>"'
   'arandr: Edit screen layouts with <XF86Video>'
)

source=('mrduX::git+http://gitlab.com/mrduX/mrduX')
md5sums=('SKIP')

pkgver() {
   cd mrduX
   git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/mrduX
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p $pkgdir/usr/share
  cp -r configs $pkgdir/usr/share/mrduX
}
