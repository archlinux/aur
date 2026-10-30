# Maintainer: Yast <yastcher@gmail.com>
pkgname=tapeback-cuda
pkgver=0.10.2
pkgrel=1
pkgdesc="CUDA 12 cuBLAS/cuDNN runtime for GPU-accelerated transcription in tapeback"
arch=('any')
url="https://github.com/yastcher/tapeback"
license=('Apache-2.0')
depends=('tapeback')
optdepends=('cuda: NVIDIA toolkit/driver for GPU access')
install=tapeback-cuda.install

# Meta-package: pip deps installed into /opt/tapeback/ venv by the install hook.
# faster-whisper's ctranslate2 is built against CUDA 12 and dlopens libcublas.so.12
# / libcudnn.so.9, which are absent on CUDA 13 systems (e.g. recent Arch) — without
# them GPU transcription silently falls back to CPU. These wheels provide them, and
# tapeback preloads them on startup. ~700 MB; install only if you transcribe on GPU.

package() {
    install -Dm644 /dev/stdin "$pkgdir/usr/share/doc/$pkgname/README" <<EOF
tapeback-cuda: CUDA 12 cuBLAS/cuDNN for GPU-accelerated transcription.
Pip dependencies installed into /opt/tapeback/ venv by the install hook.
EOF
}
