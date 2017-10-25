# Maintainer: David Runge <dave@sleepmap.de>
pkgname=uenv
pkgver=0.9
pkgrel=2
pkgdesc="Useful scripts, systemd timer/service units and their configuration"
arch=('any')
url="https://sleepmap.de/software/uenv"
license=('GPL3')
makedepends=('git')
optdepends=(
  'arch-audit: For updating MOTD with security info'\
  'autossh: For autotunnel (SSH tunnel)'\
  'compton: For compton user service'\
  'conky: For conky user service'\
  'cpupower: For cpupower settings on linux-rt'\
  'glances: For monitoring user service (running in separate tmux environment)'\
  'htop: For monitoring user service (running in separate tmux environment)'\
  'irssi: For irssi in a separate tmux environment'\
  'jack2: For profile based JACK user service'\
  'linux-rt: For cpupower and JACK services'\
  'mpd: For mpd user service connecting to server profiles'\
  'openssh: For ssh-agent as systemd user service'\
  'python-lolcat: For colorful output of MOTD'\
  'rtorrent: For rtorrent user and system service'\
  'tmux: For monitoring, rtorrent and tmux user services'\
  'weechat: For weechat in a separate tmux environment'
)
conflicts=('uenv-git')
backup=(
  'etc/jack/fw1'\
  'etc/conf.d/postpone-screensaver'\
  'etc/default/cpupower-rt'\
  'etc/default/rtorrent@.conf'
)
source=("https://git.sleepmap.de/software/${pkgname}.git/snapshot/${pkgname}-${pkgver}.tar.gz")
sha512sums=('478db96dec5887bc427c7ca2f072a9026c70b04cfca12d85e65d431c1386a79e6468a9cc66cda46ea4532b7dc5ecc0d0d4a56a7a824ef67e732910df25e14b07')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -t "${pkgdir}/usr/bin/" -Dm0744 bin/*
  install -t "${pkgdir}/usr/lib/systemd/scripts/" -Dm0755 scripts/*
  install -t "${pkgdir}/usr/lib/systemd/system/" -Dm0644 system/*
  install -t "${pkgdir}/usr/lib/systemd/user/" -Dm0644 user/*
  install -t "${pkgdir}/etc/jack/" -Dm0644 config/jack/*
  install -t "${pkgdir}/etc/systemd-analyze-plot/plot.conf" -Dm0644 config/plot.conf
  install -Dm0644 config/cpupower-rt "${pkgdir}/etc/default/cpupower-rt"
  install -Dm0644 config/postpone-screensaver "${pkgdir}/etc/conf.d/postpone-screensaver"
  install -Dm0644 config/rtorrent@.conf "${pkgdir}/etc/default/rtorrent@.conf"
  install -Dm0644 config/autotunnel/example.conf "${pkgdir}/etc/autotunnel/example.conf"
  install -Dm0644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm0644 NEWS "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
}

# vim:set ts=2 sw=2 et:
