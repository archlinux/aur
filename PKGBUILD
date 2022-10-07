# Maintainer: D1nuc0m <d1nuc0m@protonmail.com>
# Submitter and previous Maintainer: Oliver Mangold <omgold@dray.be>
# Thanks to bartus <arch-user-repo@bartus.33mail.com>, qub1750ul <dev.gmasino@pm.me>, Zekromaster <dev@zekromaster.net>

_pkgname=luxcorerender
pkgname="${_pkgname}-bin"
pkgver=2.6
pkgrel=1
pkgdesc="Physically correct, unbiased rendering engine"
arch=('x86_64')
url="https://luxcorerender.org/"
license=('Apache')
# Dependencies checked through "ldd ./luxcoreui", filtered with namcap
# python3 because of pyluxcore
depends=(embree gtk3 openimagedenoise "python>=3.0")
makedepends=("python>=3.0")
optdepends=('cuda: OptiX/CUDA acceleration'
            'ocl-icd: gpu acceleration'
            'opencl-driver: OPENCL gpu acceleration'
            'pyside2: pyluxcoretools gui')
provides=(${_pkgname})
source=("https://github.com/LuxCoreRender/LuxCore/releases/download/luxcorerender_v${pkgver}/luxcorerender-v${pkgver}-linux64.tar.bz2"
        luxcorerender.desktop
        luxcorerender.png
        pyluxcore.desktop)
sha512sums=('177ace570679971fe0184e875e13351d293638fb0cbf28480f0187d796ad0df0f92f9382c7193f28dbb0315aa46ff0f1de72856f23cad4fc9becfcf8e5add0f9'
            '24341c3d4c989031c3ec405bf5a26693b5f863255b50e917357af609b7a222e704032155bd256e624c653d4906e6f116330a9a48e767c453bf1eb730d08bd64e'
            '8051deb8edc98d9d48126d323230db83e0c9dd7de826d4da048cbd05b99c73d89d15d6666a81791e9c8165b9d8996692316d66877d2c776d5823a4895ac0a729'
            '3a447e5266908b3fd0e2a0f4fb72d5cda4286bd07d30eef73be9132b551f5d37fc0506b6923fda7d91ddd7fa1cb2ecaca1072393cb1045ea51472d490c34f8a7')

package() {

  local pkgshr="${pkgdir}/usr/share/${_pkgname}"
  
  install -m 644 -Dt "${pkgdir}/usr/share/applications" luxcorerender.desktop pyluxcore.desktop
  
  cd "${srcdir}/LuxCore"
  
  install -m 755 -Dt "${pkgdir}/usr/bin" luxcoreui
  install -m 644 -Dt "${pkgdir}/opt/${_pkgname}" pyluxcore.so pyluxcoretools.zip
  install -m 644 -Dt "$pkgshr" AUTHORS.txt COPYING.txt README.md "${srcdir}/luxcorerender.png"
  cp -r scenes "${pkgshr}/"
}
