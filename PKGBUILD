pkgbase='python-realesrgan'
pkgname=('python-realesrgan' 'realesrgan-model')
pkgver=0.2.3.0
pkgrel=1
pkgdesc="Real-ESRGAN aims at developing Practical Algorithms for General Image Restoration. "
arch=('x86_64')
url="https://github.com/xinntao/Real-ESRGAN"
license=('BSD 3-Clause')
depends=('python-basicsr>=1.3.4.9' 'python-facexlib' 'python-gfpgan' 'python-numpy' 'python-opencv'
'python-pillow' 'python-pytorch' 'python-torchvision' 'python-tqdm')
makedepends=('python-setuptools')

source=("https://github.com/xinntao/Real-ESRGAN/archive/refs/tags/v$pkgver.tar.gz"
'https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth'
'https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.4/RealESRGAN_x4plus_anime_6B.pth'
'https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.1/RealESRGAN_x2plus.pth'
'https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.3.0/RealESRGANv2-animevideo-xsx2.pth'
'https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.3.0/RealESRGANv2-animevideo-xsx4.pth'
'https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.1/RealESRNet_x4plus.pth')
sha256sums=('692d557c2d2c3b81dab8aea12668fdb502dde44d4bf708b57bdef831ea50aa90'
            '4fa0d38905f75ac06eb49a7951b426670021be3018265fd191d2125df9d682f1'
            'f872d837d3c90ed2e05227bed711af5671a6fd1c9f7d7e91c911a61f155e99da'
            '49fafd45f8fd7aa8d31ab2a22d14d91b536c34494a5cfe31eb5d89c2fa266abb'
            '27985aa2198711ecd72f9bb274ec7b164e018fc9ce2933daaa7c7ab36a2bd3fe'
            '5e04b111c16d5b40deb8f8062d09fdff72fa80281fb9607be23b62650c08daff'
            'a820b9bde89a874d7599d545567308ce6c128fc8754a53208eda016d40aa81df')

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
    sed -i "s|https://github.com/TencentARC/GFPGAN/releases/download/v0.2.0|/usr/share/gfpgan-model|" ${pkgdir}/usr/bin/realesrgan
    chmod 755 ${pkgdir}/usr/bin/realesrgan
    cp Real-ESRGAN-${pkgver}/inference_realesrgan_video.py ${pkgdir}/usr/bin/realesrgan-video
    sed -i "1i#!/usr/bin/python" ${pkgdir}/usr/bin/realesrgan-video
    sed -i "s|experiments/pretrained_models|/usr/share/realesrgan-model|" ${pkgdir}/usr/bin/realesrgan-video
    sed -i "s|https://github.com/TencentARC/GFPGAN/releases/download/v0.2.0|/usr/share/gfpgan-model|" ${pkgdir}/usr/bin/realesrgan-video
    chmod 755 ${pkgdir}/usr/bin/realesrgan-video
}
