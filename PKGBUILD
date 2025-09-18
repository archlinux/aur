# Maintainer: DeepChirp <DeepChirp@outlook.com>
pkgname=easyeffects-digitalone1-presets-git
_origin=EasyEffects-Presets
pkgver=r68.32d0f41
pkgrel=1
pkgdesc="Community Presets for Easyeffects: Loudness Equalizer"
arch=('any')
url="https://github.com/Digitalone1/${_origin}"
license=('MIT')
depends=('easyeffects>=7.0.0' 'lsp-plugins-lv2>=1.2.17')
makedepends=('git')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("${_origin}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_origin}"

  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_origin}"

  outdir="${pkgdir}/usr/share/easyeffects/output/Digitalone1-Presets"
  install -dm755 "${outdir}"

  install -m644 "LoudnessEqualizer.json" "${outdir}/" \
    || { echo "Missing LoudnessEqualizer.json"; return 1; }
  install -m644 "LoudnessCrystalEqualizer.json" "${outdir}/" \
    || { echo "Missing LoudnessCrystalEqualizer.json"; return 1; }

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
