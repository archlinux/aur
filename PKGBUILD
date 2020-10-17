pkgname=ntfs3-dkms
pkgver=9.0.0
pkgrel=1
pkgdesc="NTFS read-write driver GPL implementation by Paragon Software. Current version works with NTFS (including v3.1), normal/compressed/sparse files and supports journal replaying."
arch=('any')
url='https://www.paragon-software.com/'
license=('GPL2')
depends=('dkms')
options=('!strip')
source=(Makefile.patch
        dkms.conf
        "v$pkgver~1.patch::https://lore.kernel.org/patchwork/patch/1321976/raw"
        "v$pkgver~2.patch::https://lore.kernel.org/patchwork/patch/1321975/raw"
        "v$pkgver~3.patch::https://lore.kernel.org/patchwork/patch/1321973/raw"
        "v$pkgver~4.patch::https://lore.kernel.org/patchwork/patch/1321971/raw"
        "v$pkgver~5.patch::https://lore.kernel.org/patchwork/patch/1321977/raw"
        "v$pkgver~6.patch::https://lore.kernel.org/patchwork/patch/1321969/raw"
        "v$pkgver~7.patch::https://lore.kernel.org/patchwork/patch/1321978/raw"
        "v$pkgver~8.patch::https://lore.kernel.org/patchwork/patch/1321972/raw")
sha512sums=('ab49381b37714bc61b17c5a4d857aac776a674574e8dbd46738eab438eef984b7762430cac05860038d8a875d5538347a1e1176acfd2169d9b5a640a9ef04d7c'
            '5f4087b05eb831fe277f1894240a8d72824daa821317e873f77574fc25d97b273ac3ddd8075d58b96c5e4e441de630817d68a3fa33d6176e26743cdb17ec664f'
            'a68079d0a190bc578b4dcaeb9f4715d7a51955bc66b0ff75e4d78cb06c67fba2f56c2f04ee290209b5347a808767af6abec8cfd89fc04f87a56eaa44f6a0edba'
            'fa5699a286a8d7107410f5ef3c1605facc9673657c3e38a258e5ca9d820d69eaa18f21fb96ca1ad8e453b8d72e64f9e5ba4c6cc6336188318a2118a7764f8d2c'
            '747a71c63dbbb3017216c4788008a5bab5709f4c73606e81daa68912d6663035acfffdde84930d8f49bffef357dabb3d71436f1efe1174e22c306638e04980f2'
            'f61e27440d164b16f36c046e0db7577cc5bbd701526ccbc461c92e188794876e258d037781664400de72828c88b1372c4d00f531c81486f574f6a9bcd3c34d29'
            'eea1871626a0bbc397ad0a38068d8c645d2e74735ccd1c37fb6eb620a14ccef9e5d946737cac2b3b028eccb82f7f91221940ba34ad18874e684afc6da629b84b'
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
