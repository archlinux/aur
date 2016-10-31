# Maintainer: Miloš Polakovič (milos@mailbox.org)

pkgname=mrdux-git
pkgver=0.4.r0.g4573dd8
pkgrel=1
pkgdesc="A desktop environment focused on productivity, speed and aesthetics"
url="https://gitlab.com/mpolakovic/mrduX"
license=('GPL3')

arch=('any')
makedepends=(sh 'git')
depends=(
   'xorg-server' 'xorg-xinit' 'xorg-xsetroot' 'xorg-xmessage' 'xorg-xrandr'
   'xf86-video-vesa' 'xscreensaver' 'alsa-utils' 'sl' 'zsh'
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
   'xss-lock-git: Automatically lock the screen on suspend/hibernate'
   'xcursor-pixelfun: Minimalistic cursor theme with a piece of old-school'
   'shutter: Take a screenshot with M-<Print>'
   'pulseaudio-ctl: Control sound volume with multimedia keys'
   'netmenu: Switch active network profile with M-S-n (when using netctl)'
   'wavemon: Show wireless network monitor scratchpad with M1-C-<Home>'
   'htop: Show interactive process viewer scratchpad with M1-C-<Delete>'
   'vtop: Show interactive system monitor scratchpad with M1-C-<Insert>'
   'feh: Set desktop wallpaper on the command-line with "feh --bg-fill <file>"'
   'arandr: Edit screen layouts with <XF86Video>'
   'paper-icon-theme-git: mrduX default icon theme'
   'adapta-gtk-theme: mrduX default gtk theme'
   'ttf-google-fonts-git: ~300MB of font goodness'
)

source=('mrduX::git+http://gitlab.com/mpolakovic/mrduX')
install='mrduX.install'
md5sums=('SKIP')
provides=('mrduX')

pkgver() {
   cd mrduX
   git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/mrduX/mrduX-cli
  python setup.py install --root="$pkgdir/" --optimize=1
  cd $srcdir/mrduX
  mkdir -p $pkgdir/usr/share
  cp -r dotfiles $pkgdir/usr/share/mrduX
}
