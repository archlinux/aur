pkgname=ntfs3-dkms
pkgver=4.0.0
pkgrel=1
pkgdesc="NTFS read-write driver GPL implementation by Paragon Software. Current version works with NTFS (including v3.1), normal/compressed/sparse files and supports journal replaying."
arch=('any')
url='https://www.paragon-software.com/'
license=('GPL2')
depends=('dkms')
options=('!strip')
source=('1.patch::https://lore.kernel.org/patchwork/patch/1300757/raw'
        '2.patch::https://lore.kernel.org/patchwork/patch/1300720/raw'
        '3.patch::https://lore.kernel.org/patchwork/patch/1300738/raw'
        '4.patch::https://lore.kernel.org/patchwork/patch/1300721/raw'
        '5.patch::https://lore.kernel.org/patchwork/patch/1300758/raw'
        '6.patch::https://lore.kernel.org/patchwork/patch/1300718/raw'
        '7.patch::https://lore.kernel.org/patchwork/patch/1300735/raw'
        '8.patch::https://lore.kernel.org/patchwork/patch/1300724/raw'
        Makefile.patch
        dkms.conf)
sha512sums=('ff1a772810752293b8e35a9ab0b5c798ecf45ae7d170d0b3a7578e802daf21ee540d0f19dc6d66e85a3e0b910b0eea11aa37ab727ae00f3bf7d092cc39b2fc7b'
            'b1fedc67c9bdb6edcda44be0c9c197dd6a038fa4594f6b00d5f9ae4b228649902e930771a7a37db38cb4a3b59b68b75b65400d1988be68c55c3d4f9b25025ce4'
            '4ddd14f99231704cbd9d386a3f6b4131930fc66b5752ed2c4aa042c5e051f1ca6beaddf6bf3194387588ee3ec228e030b2846cdafab201bc8985e2850ea003e1'
            '01e92e4f188de09b21a174f0a1355b3810abf0a911da436a7244e2ee1eecfcfcff46ba00a7827b55a37e1efc2d7401acfb5eeb83ac4e60f971d2369e74c54ba2'
            '73f144aab665acb3278e7902b25f83da0ab3a417f9a301321dae9a16e36ce098f0d02c2cc9d89bf779ec59bed006bdc2e8358193debef84eacb19700ef3cac84'
            '9c7f11d4cd755c91f4581a3ac45c22295b790d9a642ccbc44579ea4d4b4de2d82dfb8932967c3c1a0ec8f0e8a497acc327a0cc49c5b6f2ce9da208e97809cd74'
            'd6a782cbe179937f1d0f910788557876b72c40beb51367ab1fb3177def37dfadf3e3b697818f45b51f4b9d71a8f61d599026ea7aa15c58b6b687ab0e9c217bb7'
            'a168442e6407e3db5b6648bbf6af8a76133cff27ca603d9fc55492e7c1b1c613af49a29a9b5f7e469f786d4510f44d8fd342be6ccf3e52db7658056dcf996730'
            'ab49381b37714bc61b17c5a4d857aac776a674574e8dbd46738eab438eef984b7762430cac05860038d8a875d5538347a1e1176acfd2169d9b5a640a9ef04d7c'
            '5f4087b05eb831fe277f1894240a8d72824daa821317e873f77574fc25d97b273ac3ddd8075d58b96c5e4e441de630817d68a3fa33d6176e26743cdb17ec664f')


prepare() {
  mkdir -p ${pkgname}-${pkgver}
  cd ${pkgname}-${pkgver}
  patch -p3 -N -f -i ../1.patch
  patch -p3 -N -f -i ../2.patch
  patch -p3 -N -f -i ../3.patch
  patch -p3 -N -f -i ../4.patch
  patch -p3 -N -f -i ../5.patch
  patch -p3 -N -f -i ../6.patch
  patch -p3 -N -f -i ../7.patch
  patch -p3 -N -f -i ../8.patch
  patch -p1 -N -i ../Makefile.patch
}

package() {
  mkdir -p "${pkgdir}/usr/src"
  cp -r "${pkgname}-${pkgver}" "${pkgdir}/usr/src/ntfs3-${pkgver}"
  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/ntfs3-${pkgver}/dkms.conf"
}
