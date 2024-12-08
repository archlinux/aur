# Maintainer: robertfoster

pkgname=overte-server-bin
_date=2024.11.1
pkgver="${_date}.07c57f6"
pkgrel=1
pkgdesc="Overte platform, based on the High Fidelity Engine (server)"
arch=('aarch64' 'x86_64')
url="https://overte.org"
license=('Apache-2.0')
depends=(
  'libglvnd'
  'libstdc++5'
  'mesa'
  'openssl'
  'qt5-base'
  'qt5-declarative'
  'qt5-websockets'
)
makedepends=('rpmextract')
provides=('overte' 'overte-server')
conflicts=('overte' 'overte-server')
source=(
  'overte.sysusers'
  'overte.tmpfiles'
)
source_x86_64=("https://overte-public.fra1.digitaloceanspaces.com/build/overte/release/${_date}/overte-server-${pkgver}-1.fc40.x86_64.rpm")
source_aarch64=("https://overte-public.fra1.digitaloceanspaces.com/build/overte/release/${_date}/overte-server-${pkgver}-1.fc40.aarch64.rpm")

package() {
  cd "${srcdir}"
  cp -rv opt usr "${pkgdir}"
  rm -rf "${pkgdir}/usr/lib/.build-id"
  mkdir -p "${pkgdir}/etc/opt/overte"

  install -D -m644 "${srcdir}/overte.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/overte.conf"
  install -D -m644 "${srcdir}/overte.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/overte.conf"
}

sha256sums=('503dfd4562efdbb01f5e714a89d9b23a675e32f9733552532750393be85ca0e3'
  '83b66df9d94878ca1de31e85a48e905501a7db202bee9950e6c2ab32b85b1461')
sha256sums_aarch64=('26712883af8892fedc6f1f1a24c789789bffa1deb3d2b8c17d8164bf4ea94ef7')
sha256sums_x86_64=('06040ba788664cbc640e92f0f7dbd68833b6cb7a2dfbf7f56fcfdbd421275318')
