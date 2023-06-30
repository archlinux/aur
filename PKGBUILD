# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: robertfoster

pkgname="mimic"
pkgver=0.2.4
pkgrel=3
pkgdesc="A fast, local, neural text to speech system for Mycroft"
url="https://mycroft.ai/mimic-3/"
license=("AGPL3")
arch=("any")
provides=("mimic")
conflicts=("mimic-bin")
depends=("espeak-phonemizer"
         "python"
         "python-dataclasses-json"
         "python-epitran"
         "python-gruut-ipa" # requirements.txt wants python-gruut, which has broken dependencies in aur
         "python-numpy"
         "python-onnxruntime"
         "python-phonemes2ids"
         "python-quart"
         "python-quart-cors"
         "python-requests"
         "python-swagger-ui-py"
         "python-tqdm"
         "python-xdgenvpy")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://github.com/MycroftAI/mimic3/releases/download/release%2Fv$pkgver/mycroft_mimic3_tts-$pkgver.tar.gz")
sha256sums=('60cd282274c94967e11845b9127ff2eb7ba936341de0e231107297c0c70d2a27')
options=("!strip")

build(){
 cd "mycroft_mimic3_tts-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "mycroft_mimic3_tts-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 ln -s "/usr/bin/mimic3" "$pkgdir/usr/bin/mimic"
 ln -s "/usr/bin/mimic3-download" "$pkgdir/usr/bin/mimic-download"
 ln -s "/usr/bin/mimic3-server" "$pkgdir/usr/bin/mimic-server"
}


