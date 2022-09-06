# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=stable-diffusion-intel
pkgver=20220906
pkgrel=1
pkgdesc='Stable diffusion using an Intel CPU (includes a txt2img command that takes a prompt)'
arch=(x86_64)
url='https://github.com/bes-dev/stable_diffusion.openvino'
license=(Apache2)
depends=(openvino python-diffusers python-ftfy python-huggingface-hub python-numpy python-opencv python-scipy python-streamlit python-tqdm python-transformers python-watchdog)
source=("git+$url#commit=294dd34234f0629f69d5af5b1190841560242969")
b2sums=(SKIP)

prepare() {
  echo -e '#!/bin/sh\nexport PYTHONPATH+=/opt/intel/openvino/python/python3.10\ntime /usr/bin/python3 /opt/stable-diffusion-intel/txt2img --prompt "$@"' > txt2img.sh
}

package() {
  install -d "$pkgdir/opt"
  cp -r stable_diffusion.openvino "$pkgdir/opt/$pkgname"
  mv "$pkgdir/opt/$pkgname/demo.py" "$pkgdir/opt/$pkgname/txt2img"
  install -d "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv "$pkgdir/opt/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 txt2img.sh "$pkgdir/usr/bin/txt2img"
}
