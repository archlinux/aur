# Maintainer: robertfoster

pkgname=overte-server-bin
_date=2026.10.1 # renovate: datasource=github-releases depName=overte-org/overte
# Build hash is part of the package name and can't be derived from the tag; a Renovate
# bump of _date will fail updpkgsums until this is updated by hand.
_hash=9c51bae
pkgver="${_date}.${_hash}"
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
provides=('overte' 'overte-server')
conflicts=('overte' 'overte-server')
source=(
  'overte.sysusers'
  'overte.tmpfiles'
)
source_x86_64=("https://overte-public.fra1.digitaloceanspaces.com/build/overte/release/${_date}/overte-server_${_date}-${_hash}-debian-13-1_amd64.deb")
source_aarch64=("https://overte-public.fra1.digitaloceanspaces.com/build/overte/release/${_date}/overte-server_${_date}-${_hash}-debian-13-1_arm64.deb")
noextract=("overte-server_${_date}-${_hash}-debian-13-1_"{amd64,arm64}.deb)

package() {
  cd "${srcdir}"
  bsdtar -xf overte-server_*.deb data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir}" --no-same-owner ./opt ./usr
  mkdir -p "${pkgdir}/etc/opt/overte"

  install -D -m644 "${srcdir}/overte.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/overte.conf"
  install -D -m644 "${srcdir}/overte.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/overte.conf"
}

sha256sums=('503dfd4562efdbb01f5e714a89d9b23a675e32f9733552532750393be85ca0e3'
            '83b66df9d94878ca1de31e85a48e905501a7db202bee9950e6c2ab32b85b1461')
sha256sums_aarch64=('71b6ffb2290ba018df29412b29935b43373bce9b4d09f089903d5a92f50dea8d')
sha256sums_x86_64=('05c43ceb2160306142bac3eeedc243c0f1ca506033a26e256863b7fbf871af5b')
