pkgbase='python-realesrgan'
pkgname=('python-realesrgan' 'realesrgan-model')
pkgver=0.3.0
pkgrel=1
pkgdesc="Real-ESRGAN aims at developing Practical Algorithms for General Image Restoration. "
arch=('x86_64')
url="https://github.com/xinntao/Real-ESRGAN"
license=('BSD 3-Clause')
depends=('python-basicsr' 'python-facexlib' 'python-gfpgan' 'python-numpy' 'python-opencv'
'python-pillow' 'python-pytorch' 'python-torchvision' 'python-tqdm')
makedepends=('python-setuptools')

source=("https://github.com/xinntao/Real-ESRGAN/archive/refs/tags/v$pkgver.tar.gz"
"https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesr-animevideov3.pth"
'https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth'
'https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.4/RealESRGAN_x4plus_anime_6B.pth'
'https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.1/RealESRGAN_x2plus.pth'
'https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.1/RealESRNet_x4plus.pth'
'https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesr-general-wdn-x4v3.pth'
'https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesr-general-x4v3.pth'
)
sha256sums=('4fbaa9470fc2e2bffa2f6b0e9b7304b3102d7b4d0c4b9dc3a7ff3d237499fed1'
            'b8a8376811077954d82ca3fcf476f1ac3da3e8a68a4f4d71363008000a18b75d'
            '4fa0d38905f75ac06eb49a7951b426670021be3018265fd191d2125df9d682f1'
            'f872d837d3c90ed2e05227bed711af5671a6fd1c9f7d7e91c911a61f155e99da'
            '49fafd45f8fd7aa8d31ab2a22d14d91b536c34494a5cfe31eb5d89c2fa266abb'
            'a820b9bde89a874d7599d545567308ce6c128fc8754a53208eda016d40aa81df'
            '1641f8c4464b9f097c9fdda5589273713f67cf59f3d909e0bd688f0cee269dca'
            '8dc7edb9ac80ccdc30c3a5dca6616509367f05fbc184ad95b731f05bece96292')

package_python-realesrgan() {
    optdepends=('realesrgan-model: pre-trained model and inference script')
    cd Real-ESRGAN-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_realesrgan-model() {
    pkgdesc="Pre-trained model and interference script for python-realesrgan."
    depends=('python-realesrgan')
    mkdir -p ${pkgdir}/usr/share/realesrgan-model
    cp *.pth ${pkgdir}/usr/share/realesrgan-model/
    mkdir -p ${pkgdir}/usr/bin
    cp Real-ESRGAN-${pkgver}/inference_realesrgan.py ${pkgdir}/usr/bin/realesrgan
    sed -i "1i#!/usr/bin/python" ${pkgdir}/usr/bin/realesrgan
    sed -i "s|experiments/pretrained_models|/usr/share/realesrgan-model|" ${pkgdir}/usr/bin/realesrgan
    sed -i "s|https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0|/usr/share/gfpgan-model|" ${pkgdir}/usr/bin/realesrgan
    chmod 755 ${pkgdir}/usr/bin/realesrgan
    cp Real-ESRGAN-${pkgver}/inference_realesrgan_video.py ${pkgdir}/usr/bin/realesrgan-video
    sed -i "1i#!/usr/bin/python" ${pkgdir}/usr/bin/realesrgan-video
    sed -i "s|experiments/pretrained_models|/usr/share/realesrgan-model|" ${pkgdir}/usr/bin/realesrgan-video
    sed -i "s|https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0|/usr/share/gfpgan-model|" ${pkgdir}/usr/bin/realesrgan-video
    chmod 755 ${pkgdir}/usr/bin/realesrgan-video
}
