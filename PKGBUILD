name=ultimatevocalremovergui
pkgname=${name}-git
pkgver=5.6.1
pkgrel=1
pkgdesc="This application uses state-of-the-art source separation models to remove vocals from audio files. UVR's core developers trained all of the models provided in this package (except for the Demucs v3 and v4 4-stem models)."
arch=('any')
url=https://github.com/Anjok07/ultimatevocalremovergui
license=('custom:MIT License')
depends=('python-statsmodels' 'python-onnx2pytorch' 'python-soundfile' 'python-numpy' 'python-ml-collections' 'python-matchering' 'python-natsort' 'python-llvmlite' 'python-scipy' 'python-pytorch' 'python-wget' 'python-librosa' 'python-kthread' 'python-samplerate' 'python-urllib3' 'python-screeninfo' 'python-yaml' 'python-pyperclip' 'python-playsound' 'python-cryptography' 'python-diffq' 'python-audioread' 'python-certifi' 'python-einops' 'python-pydub' 'python-psutil' 'python-pyglet' 'python-omegaconf' 'python-pillow' 'python-julius-git' 'python-altgraph' 'python-opencv' 'python-pytorch-lightning' 'python-resampy' 'python-onnxruntime' 'soundtouch' 'python-audioop-lts' 'tk' 'python-deadlib' 'python-beartype' 'python-rotary-embedding-torch')
makedepends=('git')
tkdnd2=tkinterdnd2
source=("${name}::git+https://github.com/Anjok07/ultimatevocalremovergui.git"
    "${tkdnd2}::git+https://github.com/Eliav2/tkinterdnd2.git"
	"UVR.sh"
	"UVR.diff")
sha256sums=("SKIP"
    "SKIP"
	"SKIP"
	"SKIP")

prepare() {
  cd "${srcdir}/${name}"
  git checkout "v5.6.0_roformer_add+directml"
  git apply --ignore-whitespace ../UVR.diff
  rm -rf "${srcdir}/${name}/gui_data/${tkdnd2}"
  cp -r "${srcdir}/${tkdnd2}/${tkdnd2}" "${srcdir}/${name}/gui_data/"
}


package() {
  install -d "${pkgdir}/opt/${name}"
  chown -R $USER:$USER "${pkgdir}/opt/${name}"
  cp -r "${srcdir}/${name}/." "${pkgdir}/opt/${name}"
  chown -R $USER:$USER "${pkgdir}/opt/${name}"
  install -Dm755 "${srcdir}/UVR.sh" "${pkgdir}/usr/bin/UVR"
}
