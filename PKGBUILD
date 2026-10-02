# Maintainer: phaylali <phaylali at github>
pkgname=obs-omniversify-multichat-plugin
pkgver=0.2.0
pkgrel=1
pkgdesc="OBS dock for multichat (Twitch/Kick) chat preview with local GPU-accelerated TTS; auto-starts its TTS backend with OBS"
arch=('x86_64')
url="https://github.com/phaylali/obs-omniversify-tts"
license=('MIT')
depends=('obs-studio' 'qt6-base' 'qt6-websockets'
         'python' 'python-fastapi' 'uvicorn' 'python-pydantic'
         'python-onnxruntime-rocm' 'python-numpy' 'python-requests'
         'python-curl_cffi' 'python-pydub' 'python-soundfile'
         'python-pathvalidate' 'python-sounddevice' 'piper-tts')
makedepends=('cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c905e0bd91d0671afc3832b6905f895b64f80301f0575fa6bc20c68327f3e157')
# Tarball extracts to obs-omniversify-tts-$pkgver/ (GitHub repo name)

build() {
  cmake -B build -S "obs-omniversify-tts-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build -j"$(nproc)"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
