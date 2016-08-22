# Maintainer: Miloš Polakovič (milos@mailbox.org)

pkgname=mrdux-git
pkgver=0.3.r0.g57356da
pkgrel=1
pkgdesc="A desktop environment focused on productivity, speed and aesthetics"
url="https://gitlab.com/mpolakovic/mrduX"
license=('GPL3')

arch=('any')
makedepends=(sh 'git')
depends=(
   'xorg-server' 'xorg-xinit' 'xorg-xsetroot' 'xorg-xmessage' 'xorg-xrandr'
   'xf86-video-vesa' 'alsa-utils' 'sl'
   # Window manager (xmonad) and status bar (xmobar)
   'xmonad' 'xmonad-contrib' 'xmobar-alsa'
   # Application launchers and terminal emulators
   'dmenu' 'gmrun' 'xterm' 'rxvt-unicode'
   # Fonts used throughout the graphical environment
   'ttf-envy-code-r' 'ttf-hack' 'ttf-webhostinghub-glyphs'
   # Python dependencies for the mXinstall tool
   'python-setuptools' 'python-yaml' 'python-click'
)
optdepends=(
   'light: Adjust screen backlight with M-<Up> and M-<Down>'
   'redshift-adjust: Adjust screen temperature with M-<Left> and M-<Right>'
   'xscreensaver: Lock the screen with M-S-l (also provides a screensaver)'
   'xcursor-pixelfun: Minimalistic cursor theme with a piece of old-school'
   'shutter: Take a screenshot with M-<Print>'
   'pulseaudio-ctl: Control sound volume with dedicated keys'
   'netmenu: Switch netctl active network profile with M-S-n'
   'wavemon: Show wireless network monitor scratchpad with M1-C-<Home>'
   'htop: Show interactive process viewer scratchpad with M1-C-<Delete>'
   'vtop: Show interactive system monitor scratchpad with M1-C-<Insert>'
   'terminology: Start a fancy EFL-based terminal emulator with M-S-M1-<Return>'
   'feh: Set desktop wallpaper on the command-line with "feh --bg-fill <file>"'
   'arandr: Edit screen layouts with <XF86Video>'
   'paper-icon-theme-git: mrduX default icon theme'
   'adapta-gtk-theme: mrduX default gtk theme'
   'ttf-google-fonts-git: ~300MB of font goodness'
)

source=('mrduX::git+http://gitlab.com/mpolakovic/mrduX')
install='mrduX.install'
md5sums=('SKIP')
provides=('mrduX' 'mXinstall')

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
