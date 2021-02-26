# Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

pkgname=sshd-launcher
pkgver=1
pkgrel=1
pkgdesc="sudoers & desktop file to launch sshd on demand"
arch=('any')
# url=None
license=('GPL')
depends=('sudo' 'openssh' 'systemd')
install=${pkgname}.install
source=('sshd.sudoers' 'sshd.desktop')
# Icons orignally proposed for github.com/muriloventuroso/easyssh
for size in 16 24 32 48 64 128
do
  source+=(icon-${size}.svg::https://raw.githubusercontent.com/Fatih20/easyssh/icon-redesign/data/icons/${size}/com.github.muriloventuroso.easyssh.svg)

done
sha256sums=('53b7556e84182119ba1a549b3dc5bb10e943e862afbc7947bc8f12cf8ee4152a'
            '90d25814121bc7c0902612a40046ae7013a06cf44c6e10b643fa66e33cbb111d'
            'b76a6c3f9e54a339e549aa99adffb9ecf033bb9b53b29397c4ee4be4c2634808'
            'b70c81698b988f31d68eeeb3b5b84c8ea0ea71df38976dabd358fc5dd6538642'
            'f6357aae89abae45453aa0e86326d9e98b485b27f9366a326193152b0139d706'
            '49a34642d55efecbc44587aaa430abb6aa4d1f3985ab3a07296a6af3ece383eb'
            '11f6f56090d1efe41bc46e3ebfa1dc5c67e7903d873ea2e737ae6bbca7b9ad2b'
            'c55b5869b2cb949587229ab3ccef190bc543124de7e333741612eb47c74960aa')

package() {
  cd "${srcdir}"

  install -dm750 "${pkgdir}"/etc/sudoers.d
  install -Dm440 sshd.sudoers "${pkgdir}"/etc/sudoers.d/90-sshd
  install -Dm644 sshd.desktop "${pkgdir}"/usr/share/applications/sshd.desktop

  for size in 16 24 32 48 64 128
  do
    install -Dm644 icon-${size}.svg "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.svg
  done
}
