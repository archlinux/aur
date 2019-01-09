# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=writefreely
pkgver=0.7.0
pkgrel=2
pkgdesc='Federated blogging from write.as'
arch=('x86_64')
url='https://writefreely.org/'
license=('AGPL3')
makedepends=('sqlite')
optdepends=('sqlite: For SQLite support',
            'mariadb: For MariaDB support')
backup=('var/lib/writefreely/config.ini')
install=writefreely.install
source=('writefreely-sysusers.conf'
        'writefreely.service'
        'config.ini'
        "https://github.com/writeas/writefreely/releases/download/v${pkgver}/writefreely_${pkgver}_linux_amd64.tar.gz")
sha256sums=('6c74c81e27165851daf20d4bcf958227342f063aa3ec53b1cb86a56dac565f10'
            '142fcf18320a418b73ed0678acea58ae69287e47760d6abb5283376c21092dec'
            '6946f0211b25743451954d2c155222df2aeaf7f49c3fafcb9183c6fc62a95ef9'
            '8d2e1eaa5db61080b328f2d6d8677bb68859346c6920db0bd4f7e8d7fc9149b7')

package() {
  # -o writefreely -g writefreely
  install -dm750 "${pkgdir}"/var/lib/writefreely/data
  install -dm750 "${pkgdir}"/var/lib/writefreely/keys
  install -dm750 "${pkgdir}"/var/lib/writefreely/pages
  install -dm750 "${pkgdir}"/var/lib/writefreely/static
  install -dm750 "${pkgdir}"/var/lib/writefreely/templates
  install -Dm644 writefreely.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm755 writefreely "${pkgdir}"/usr/bin/writefreely
  install -Dm644 writefreely-sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/writefreely.conf

  # These files should probably be in /usr/share and /etc but writefreely
  # expects everything in the same directory.
  install -Dm644 config.ini "${pkgdir}"/var/lib/writefreely/config.ini
  cp -r pages/* "${pkgdir}"/var/lib/writefreely/pages
  cp -r static/* "${pkgdir}"/var/lib/writefreely/static
  cp -r templates/* "${pkgdir}"/var/lib/writefreely/templates
}

# vim: ts=2 sw=2 et:
