# Maintainer: zotan <aur@zotan.email>

pkgname=iceshrimp-bin
pkgver=v2023.11.4
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

sha512sums=('60ffacb7769a54ec293b7cee10cfe4adb40d725f991a03437bbc131f8039333445a05bbd26163346431f53d3afabcd1009c5a9ddfaa20dc3c5de577f5d53996f'
            '91c456bda5c14b01cbf770a2e9e57425ac5e82226799d39e11cc6e83b219a0559eeed8693c5eb051fffb28cdd23d4682ee40f46372117880aeeddb00ecb8726f')

package() {
  cp -dpTr --no-preserve=ownership "${srcdir}/" "${pkgdir}"
  rm -f "${pkgdir}"/.{BUILDINFO,INSTALL,MTREE,PKGINFO}

  install -Dm 644 "${srcdir}/iceshrimp.hook" "${pkgdir}/usr/share/libalpm/hooks/iceshrimp.hook"
}

options=(!strip)
