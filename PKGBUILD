pkgname=ntfs3-dkms
pkgver=7.0.0
pkgrel=1
pkgdesc="NTFS read-write driver GPL implementation by Paragon Software. Current version works with NTFS (including v3.1), normal/compressed/sparse files and supports journal replaying."
arch=('any')
url='https://www.paragon-software.com/'
license=('GPL2')
depends=('dkms')
options=('!strip')
source=(Makefile.patch
        dkms.conf
        "v$pkgver~1.patch::https://lore.kernel.org/patchwork/patch/1311863/raw"
        "v$pkgver~2.patch::https://lore.kernel.org/patchwork/patch/1311861/raw"
        "v$pkgver~3.patch::https://lore.kernel.org/patchwork/patch/1311857/raw"
        "v$pkgver~4.patch::https://lore.kernel.org/patchwork/patch/1311859/raw"
        "v$pkgver~5.patch::https://lore.kernel.org/patchwork/patch/1311864/raw"
        "v$pkgver~6.patch::https://lore.kernel.org/patchwork/patch/1311865/raw"
        "v$pkgver~7.patch::https://lore.kernel.org/patchwork/patch/1311860/raw"
        "v$pkgver~8.patch::https://lore.kernel.org/patchwork/patch/1311858/raw")
sha512sums=('ab49381b37714bc61b17c5a4d857aac776a674574e8dbd46738eab438eef984b7762430cac05860038d8a875d5538347a1e1176acfd2169d9b5a640a9ef04d7c'
            '5f4087b05eb831fe277f1894240a8d72824daa821317e873f77574fc25d97b273ac3ddd8075d58b96c5e4e441de630817d68a3fa33d6176e26743cdb17ec664f'
            'cf432fc545fcf49b3e210ae31debd0e13464f43d1a0ebffc88041589fa3094f3a0c365644c6bda978cd2d02f2795d93d4758922bae17424a149c14a19d0f52ac'
            '3bbddc706398fd489c4f9afbdb5eb89a4b48ac150de3b303f0e0a8c847161acb93a08356ee83f3e7e541cebe5175b1f2c06a4aab488089fe7eec46bb546a1d7f'
            '747a71c63dbbb3017216c4788008a5bab5709f4c73606e81daa68912d6663035acfffdde84930d8f49bffef357dabb3d71436f1efe1174e22c306638e04980f2'
            'd1010919f8f73fa8aed69bc0370a8922709bc077914fea07fb0374e42b5335b7bd0bc43e01b5376c2604aa21c9347cd4bb533469bea0091c5106aef54c49372e'
            '4747012314b8261f75ea5c292f5825b7a789a54aab45bb9241dd0a7c09d287b467615fb815c5d7aa1327940bf517961ea3fce3ef0c6ad1856635dae22947d54e'
            '9c7f11d4cd755c91f4581a3ac45c22295b790d9a642ccbc44579ea4d4b4de2d82dfb8932967c3c1a0ec8f0e8a497acc327a0cc49c5b6f2ce9da208e97809cd74'
            'e9efd5acdabfe723fa96933c81d033679db92af50ab3754481ad4453b2279051bbe4d152f2643296e4b044d6d9b33808a9b9da8a467130a707f51b286b7f36a7'
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
