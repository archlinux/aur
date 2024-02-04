# Maintainer: zotan <aur@zotan.email>

pkgname=iceshrimp-bin
pkgver=v2023.12.3
pkgrel=1
pkgdesc="YAMF (Yet another Misskey fork) bringing you no-nonsense fixes, features & improvements you actually want since 2023"
arch=(x86_64)
url="https://iceshrimp.dev/iceshrimp/iceshrimp"
license=(AGPL3)

conflicts=(iceshrimp)
provides=(iceshrimp)

depends=(nodejs redis postgresql)
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

sha512sums=('2dab16ae6c589d88352e33e6cbb10f3cf50c76f940990473db48b70abe5a4c3f9efd286cd2d241d9915373ebf7954d34b5a87c408d72b9d05bc2cb500bbf8a47'
            '91c456bda5c14b01cbf770a2e9e57425ac5e82226799d39e11cc6e83b219a0559eeed8693c5eb051fffb28cdd23d4682ee40f46372117880aeeddb00ecb8726f')

package() {
  cp -dpTr --no-preserve=ownership "${srcdir}/" "${pkgdir}"
  rm -f "${pkgdir}"/.{BUILDINFO,INSTALL,MTREE,PKGINFO}

  install -Dm 644 "${srcdir}/iceshrimp.hook" "${pkgdir}/usr/share/libalpm/hooks/iceshrimp.hook"
}

options=(!strip)
