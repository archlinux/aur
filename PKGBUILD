# Maintainer: David Runge <dave@sleepmap.de>
pkgname=uenv
pkgver=0.10.0
pkgrel=1
pkgdesc='Useful scripts, systemd timer/service units and their configuration'
arch=('any')
url="https://sleepmap.de/software/uenv"
license=('GPL3')
depends=('bash')
makedepends=('git')
optdepends=('arch-audit: updating MOTD with security info'
            'autossh: autotunnel - SSH tunnel'
            'compton: compton user service'
            'conky: conky user service'
            'cpupower: Realtime kernel specific cpupower config'
            'glances: monitoring user service'
            'htop: monitoring user service'
            'irssi: tmux integration'
            'linux-rt: Realtime kernel specific cpupower config'
            'mpd: mpd user service connecting to server profiles'
            'openssh: ssh-agent as systemd user service'
            'python-lolcat: For colorful output of MOTD'
            'rtorrent: rtorrent user and system service'
            'tmux: monitoring, rtorrent and tmux user services'
            'weechat: tmux integration')
conflicts=('uenv-git')
backup=('etc/conf.d/postpone-screensaver'
        'etc/default/cpupower-rt'
        'etc/default/rtorrent@.conf')
source=("https://git.sleepmap.de/software/${pkgname}.git/snapshot/${pkgname}-${pkgver}.tar.gz")
sha512sums=('2aad588f4b0a66fce1d37816a25ea295521a4a78909f3a40da1044c14939ff18baac92e424099d8bc87bad3231b83d3c18bcf4c526565bb123e0d48d70a5823b')

package() {
  cd "${pkgname}-${pkgver}"
  install -vDm 755 bin/* -t "${pkgdir}/usr/bin/"
  install -vDm 755 scripts/* -t "${pkgdir}/usr/lib/systemd/scripts/"
  install -vDm 644 system/* -t "${pkgdir}/usr/lib/systemd/system/"
  install -vDm 644 user/* -t "${pkgdir}/usr/lib/systemd/user/"
  install -vDm 644 config/plot.conf -t "${pkgdir}/etc/systemd-analyze-plot"
  install -vDm 644 config/cpupower-rt -t "${pkgdir}/etc/default"
  install -vDm 644 config/postpone-screensaver -t "${pkgdir}/etc/conf.d"
  install -vDm 644 config/rtorrent@.conf -t "${pkgdir}/etc/default"
  install -vDm 644 config/autotunnel/example.conf -t "${pkgdir}/etc/autotunnel"
  install -vDm 644 {README.rst,NEWS} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
