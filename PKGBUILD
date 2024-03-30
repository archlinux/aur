# Maintainer: zotan <aur@zotan.email>

pkgname=iceshrimp-bin
pkgver=v2023.12.6
pkgrel=1
pkgdesc="YAMF (Yet another Misskey fork) bringing you no-nonsense fixes, features & improvements you actually want since 2023"
arch=(x86_64)
url="https://iceshrimp.dev/iceshrimp/iceshrimp"
license=(AGPL3)

conflicts=(iceshrimp)
provides=(iceshrimp)

depends=()
optdepends=(
  "ffmpeg: for video transcoding"
  "sonic: efficient full text search backend"
  "meilisearch: feature-rich full text search backend"
)

backup=("etc/iceshrimp/configuration.yml")

install="iceshrimp.install"

source=(
  "https://repo.iceshrimp.dev/archlinux/iceshrimp/os/x86_64/iceshrimp-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
  "iceshrimp.hook"
)

sha512sums=('17bdad4859dc822dd418713f0d7e5a19e0afa66ed8c134d0c3ad10f9f3ee48153f7262a44844eda8187af380a52a6529e1c9471296f3cdd56fc70a7c2fbe415d'
            '91c456bda5c14b01cbf770a2e9e57425ac5e82226799d39e11cc6e83b219a0559eeed8693c5eb051fffb28cdd23d4682ee40f46372117880aeeddb00ecb8726f')

package() {
  # Add runtime only dependencies
  depends+=(nodejs redis postgresql)

  cp -dpTr --no-preserve=ownership "${srcdir}/" "${pkgdir}"
  rm -f "${pkgdir}"/.{BUILDINFO,INSTALL,MTREE,PKGINFO}

  install -Dm 644 "${srcdir}/iceshrimp.hook" "${pkgdir}/usr/share/libalpm/hooks/iceshrimp.hook"
}

options=(!strip)
