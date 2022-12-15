_model="medium"
_model_sha1sum="fd9727b6e1217c2f614f9b698455c4ffd82463b4"
_pkgbase="whisper.cpp-model"
# Maintainer: Hauke Rehfeld <aur@haukerehfeld.de>
pkgname="${_pkgbase}-${_model}"
pkgver=1
pkgrel=1
pkgdesc=""
arch=("i686" "x86_64")
url="https://github.com/ggerganov/whisper.cpp"
license=("GPLv3")

makedepends=()
depends=()
conflicts=()
provides=()

# https://github.com/ggerganov/whisper.cpp/blob/master/models/download-ggml-model.sh
_url="https://huggingface.co/datasets/ggerganov/whisper.cpp"
_pfx="resolve/main/ggml"
_model_file="${_model}.bin"

source=("${_model_file}::${_url}/${_pfx}-${_model_file}")
sha1sums=("${_model_sha1sum}")

package() {
  modelpath="/usr/share/$pkgname/${_model_file}"
  install -Dm644 "${srcdir}/${_model_file}" "$pkgdir$modelpath"

  wrapper="whisper.cpp-${_model}"
  echo "#!/bin/sh
/usr/bin/whisper.cpp --model ${modelpath} "'$@' > "$srcdir/$wrapper"
  install -Dm755 "${srcdir}/$wrapper" "$pkgdir/usr/bin/$wrapper"


}
