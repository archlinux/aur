# Maintainer: David Runge <dave@sleepmap.de>
pkgname=uenv-git
pkgver=0.5.2.r0.g3d8ed5d
_basename=uenv
pkgrel=1
pkgdesc="Useful scripts, systemd timer/service units and their configuration"
arch=('any')
url="https://sleepmap.de/software/uenv"
license=('GPL3')
groups=()
depends=()
makedepends=('git')
optdepends=(
  'autossh: For autotunnel (SSH tunnel)'\
  'compton: For compton user service'\
  'cpupower: For cpupower settings on linux-rt'\
  'glances: For monitoring user service (running in separate tmux environment)'\
  'gnupg: For gpg-agent as systemd user service'\
  'htop: For monitoring user service (running in separate tmux environment)'\
  'irssi: For irssi in a separate tmux environment'\
  'jack2: For profile based JACK user service'\
  'linux-rt: For cpupower and JACK services'\
  'mpd: For mpd user service connecting to server profiles'\
  'openssh: For ssh-agent as systemd user service'\
  'rtorrent: For rtorrent user and system service'\
  'tmux: For monitoring, rtorrent and tmux user services'\
  'update-mirrorlist: For timed pacman mirrorlist updates'\
  'weechat: For weechat in a separate tmux environment'
)
provides=('uenv')
conflicts=('uenv')
replaces=()
backup=(
  'etc/jack/fw1'\
  'etc/conf.d/postpone-screensaver'\
  'etc/default/cpupower-rt'\
  'etc/default/rtorrent@.conf'
)
options=()
install=
source=("${_basename}::git://sleepmap.de/software/uenv.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_basename"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_basename"
  install -d ${pkgdir}/usr/lib/systemd/scripts/
  install -Dm 755 scripts/* ${pkgdir}/usr/lib/systemd/scripts/
  install -d ${pkgdir}/usr/lib/systemd/system/
  install -Dm 644 system/* ${pkgdir}/usr/lib/systemd/system/
  install -d ${pkgdir}/usr/lib/systemd/user/
  install -Dm 644 user/* ${pkgdir}/usr/lib/systemd/user/
  install -Dm 644 config/cpupower-rt ${pkgdir}/etc/default/cpupower-rt
  install -d ${pkgdir}/etc/jack/
  install -Dm 644 config/jack/* ${pkgdir}/etc/jack/
  install -d ${pkgdir}/etc/systemd-analyze-plot/
  install -Dm 644 config/plot.conf ${pkgdir}/etc/systemd-analyze-plot/plot.conf
  install -Dm 644 config/postpone-screensaver ${pkgdir}/etc/conf.d/postpone-screensaver
  install -Dm 644 config/rtorrent@.conf ${pkgdir}/etc/default/rtorrent@.conf
  install -Dm 644 config/autotunnel/example.conf ${pkgdir}/etc/autotunnel/example.conf
  install -Dm 644 README.rst ${pkgdir}/usr/share/doc/${_basename}/README.rst
  install -Dm 644 NEWS ${pkgdir}/usr/share/doc/${_basename}/NEWS
}

# vim:set ts=2 sw=2 et:
