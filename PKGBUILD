# Maintainer: teejer <teejer@users.noreply.github.com>

pkgname=uniterm-bin
pkgver=1.9.5
pkgrel=1
pkgdesc="Lightweight all-in-one terminal with 30+ protocols and a built-in autonomous AI agent"
arch=('x86_64' 'aarch64')
url="https://uniterm.net"
license=('Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('uniterm')
conflicts=('uniterm' 'uniterm-git')
options=('!strip' '!debug')

_gh="https://github.com/ys-ll/uniterm/releases/download/v${pkgver}"

source_x86_64=(
  "${_gh}/uniterm-linux-amd64-v${pkgver}.deb"
  "LICENSE::https://raw.githubusercontent.com/ys-ll/uniterm/v${pkgver}/LICENSE"
)
sha256sums_x86_64=(
  '04e6f40f2fe5e7a0482cce17cc81e1a011698d37919a574c3e58f6b3c2338cfd'
  '80b7ddff03e2b4535e40a063a1079d4e02f57826720d6c9b2eb8d635bbec0715'
)

source_aarch64=(
  "${_gh}/uniterm-linux-arm64-v${pkgver}.deb"
  "LICENSE::https://raw.githubusercontent.com/ys-ll/uniterm/v${pkgver}/LICENSE"
)
sha256sums_aarch64=(
  '966ee511cc6da26a3895d6ed07009fae3e80d2aecde4066630347292b497e915'
  '80b7ddff03e2b4535e40a063a1079d4e02f57826720d6c9b2eb8d635bbec0715'
)

package() {
  # makepkg already unpacked the upstream .deb (an ar archive) into $srcdir,
  # leaving its payload in data.tar.*. Install that verbatim: /usr/bin/uniterm,
  # /usr/share/applications/uniterm.desktop and the hicolor icons.
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
