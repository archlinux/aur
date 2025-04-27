# Maintainer: zotan <aur@zotan.email>

pkgname=iceshrimp-bin
pkgver=v2023.12.14
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

sha512sums=('317f21c2f36116f480771e9e01e748d8b4390729ae5fd351c2ae4dac2d7d22bed03ad5d9ac5cf4e7340d28c761cebb50334c60bb6b200e4986efffb48d788e7f'
            '91c456bda5c14b01cbf770a2e9e57425ac5e82226799d39e11cc6e83b219a0559eeed8693c5eb051fffb28cdd23d4682ee40f46372117880aeeddb00ecb8726f')

package() {
  # Add runtime only dependencies
  depends+=(nodejs redis postgresql)

  cp -dpTr --no-preserve=ownership "${srcdir}/" "${pkgdir}"
  rm -f "${pkgdir}"/.{BUILDINFO,INSTALL,MTREE,PKGINFO}

  install -Dm 644 "${srcdir}/iceshrimp.hook" "${pkgdir}/usr/share/libalpm/hooks/iceshrimp.hook"
}

options=(!strip)
