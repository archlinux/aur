# Maintainer: David Runge <dave@sleepmap.de>
pkgname=uenv-git
pkgver=0.9.r0.gf7aeb07
_pkg=uenv
pkgrel=1
pkgdesc="Useful scripts, systemd timer/service units and their configuration"
arch=('any')
url="https://sleepmap.de/software/uenv"
license=('GPL3')
makedepends=('git')
optdepends=(
  'arch-audit: For updating MOTD with security info'
  'autossh: For autotunnel (SSH tunnel)'
  'compton: For compton user service'
  'conky: For conky user service'
  'cpupower: For cpupower settings on linux-rt'
  'glances: For monitoring user service (running in separate tmux environment)'
  'htop: For monitoring user service (running in separate tmux environment)'
  'irssi: For irssi in a separate tmux environment'
  'jack2: For profile based JACK user service'
  'linux-rt: For cpupower and JACK services'
  'mpd: For mpd user service connecting to server profiles'
  'openssh: For ssh-agent as systemd user service'
  'python-lolcat: For colorful output of MOTD'
  'rtorrent: For rtorrent user and system service'
  'tmux: For monitoring, rtorrent and tmux user services'
  'weechat: For weechat in a separate tmux environment'
)
provides=('uenv')
conflicts=('uenv')
backup=(
  'etc/jack/fw1'
  'etc/conf.d/postpone-screensaver'
  'etc/default/cpupower-rt'
  'etc/default/rtorrent@.conf'
)
source=("git+https://git.sleepmap.de/software/uenv.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkg}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkg}"
  install -t "${pkgdir}/usr/lib/systemd/scripts/" -Dm0755 scripts/*
  install -t "${pkgdir}/usr/lib/systemd/system/" -Dm0644 system/*
  install -t "${pkgdir}/usr/lib/systemd/user/" -Dm0644 user/* 
  install -t "${pkgdir}/etc/jack/" -Dm0644 config/jack/*
  install -Dm 644 config/plot.conf "${pkgdir}/etc/systemd-analyze-plot/plot.conf"
  install -Dm 644 config/cpupower-rt ${pkgdir}/etc/default/cpupower-rt
  install -Dm 644 config/postpone-screensaver ${pkgdir}/etc/conf.d/postpone-screensaver
  install -Dm 644 config/rtorrent@.conf ${pkgdir}/etc/default/rtorrent@.conf
  install -Dm 644 config/autotunnel/example.conf ${pkgdir}/etc/autotunnel/example.conf
  install -Dm 644 README.rst ${pkgdir}/usr/share/doc/${_pkg}/README.rst
  install -Dm 644 NEWS ${pkgdir}/usr/share/doc/${_pkg}/NEWS
}
# vim:set ts=2 sw=2 et:
