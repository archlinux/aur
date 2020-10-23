pkgname=ntfs3-dkms
pkgver=10.0.0
pkgrel=1
pkgdesc="NTFS read-write driver GPL implementation by Paragon Software. Current version works with NTFS (including v3.1), normal/compressed/sparse files and supports journal replaying."
arch=('any')
url='https://www.paragon-software.com/'
license=('GPL2')
depends=('dkms')
options=('!strip')
source=(Makefile.patch
        dkms.conf
        "v$pkgver~1.patch::https://lore.kernel.org/patchwork/patch/1324020/raw"
        "v$pkgver~2.patch::https://lore.kernel.org/patchwork/patch/1324023/raw"
        "v$pkgver~3.patch::https://lore.kernel.org/patchwork/patch/1324018/raw"
        "v$pkgver~4.patch::https://lore.kernel.org/patchwork/patch/1324022/raw"
        "v$pkgver~5.patch::https://lore.kernel.org/patchwork/patch/1324025/raw"
        "v$pkgver~6.patch::https://lore.kernel.org/patchwork/patch/1324026/raw"
        "v$pkgver~7.patch::https://lore.kernel.org/patchwork/patch/1324021/raw"
        "v$pkgver~8.patch::https://lore.kernel.org/patchwork/patch/1324017/raw")
sha512sums=('ab49381b37714bc61b17c5a4d857aac776a674574e8dbd46738eab438eef984b7762430cac05860038d8a875d5538347a1e1176acfd2169d9b5a640a9ef04d7c'
            '5f4087b05eb831fe277f1894240a8d72824daa821317e873f77574fc25d97b273ac3ddd8075d58b96c5e4e441de630817d68a3fa33d6176e26743cdb17ec664f'
            'e09737020ff7337fd3ddc29234efcb602bf49b2b98e83fa6552078a64a169803171c2392249b499e4327ad9b7ddfb793fed277307f71e800179d432183c458ac'
            '115b14107f81c84c8ee8131e35f8d5f3ff31934f06f7f4f246e7604c091841aeca903ea94eafd53a9cd20751a12bb07ea882051b0e3411bc433509dc544cbe2a'
            '747a71c63dbbb3017216c4788008a5bab5709f4c73606e81daa68912d6663035acfffdde84930d8f49bffef357dabb3d71436f1efe1174e22c306638e04980f2'
            '90a7c7e4284d15b08222ee6d55938c730ea3b5ca5e0fac1f58024200f38d96e42ee96ac9a108618c91d3d8ccf70baf8fcf3fedb1734b27b7ff9b7b679a460824'
            '695f0b5a4531d8a6d1772aec407cf54918a0bce1896334bd65356c7737cc4fd8e3e89ea597f15c0885571e81a08b5b9f1cf524b7c8c1d0dbbca5fd86e4baa1f5'
            '3d50fae5962cdcd3dca7c2e5470f1a7a91e97fb91607e2bc2b4574f8c8ca38f3885099b66a1748779c978ae4a30ab364e4169db5995259a69093846b7cfab1c8'
            '15a75670a109bde45bfcde3fbd64c1f93e371f382a73a970a27913c44a21c6e4eb5a916353a8d7fb28e7211a9d2e6947e482cd97fcd331b990335074a5b6d407'
            '420547e7f200bbd32137b17ae567b18edf7be8cfa25ec483be2aaed252f42ba543a439042dd52882fd6ffce2c9abf8df73267b0720d26b27339d297832d8d9ee')


prepare() {
  mkdir -p ${pkgname}-${pkgver}
  cd ${pkgname}-${pkgver}
  for patch in "$srcdir/v$pkgver~"*
  do
    patch -p3 -N -i "$patch"
  done
  patch -p1 -N -i "$srcdir/Makefile.patch"
}

package() {
  mkdir -p "${pkgdir}/usr/src"
  cp -r "${pkgname}-${pkgver}" "${pkgdir}/usr/src/ntfs3-${pkgver}"
  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/ntfs3-${pkgver}/dkms.conf"
}
