pkgname=ntfs3-dkms
pkgver=6.0.0
pkgrel=1
pkgdesc="NTFS read-write driver GPL implementation by Paragon Software. Current version works with NTFS (including v3.1), normal/compressed/sparse files and supports journal replaying."
arch=('any')
url='https://www.paragon-software.com/'
license=('GPL2')
depends=('dkms')
options=('!strip')
source=(Makefile.patch
        dkms.conf
        "v$pkgver~1.patch::https://lore.kernel.org/patchwork/patch/1308074/raw"
        "v$pkgver~2.patch::https://lore.kernel.org/patchwork/patch/1308079/raw"
        "v$pkgver~3.patch::https://lore.kernel.org/patchwork/patch/1308077/raw"
        "v$pkgver~4.patch::https://lore.kernel.org/patchwork/patch/1308073/raw"
        "v$pkgver~5.patch::https://lore.kernel.org/patchwork/patch/1308069/raw"
        "v$pkgver~6.patch::https://lore.kernel.org/patchwork/patch/1308070/raw"
        "v$pkgver~7.patch::https://lore.kernel.org/patchwork/patch/1308078/raw"
        "v$pkgver~8.patch::https://lore.kernel.org/patchwork/patch/1308067/raw")
sha512sums=('ab49381b37714bc61b17c5a4d857aac776a674574e8dbd46738eab438eef984b7762430cac05860038d8a875d5538347a1e1176acfd2169d9b5a640a9ef04d7c'
            '5f4087b05eb831fe277f1894240a8d72824daa821317e873f77574fc25d97b273ac3ddd8075d58b96c5e4e441de630817d68a3fa33d6176e26743cdb17ec664f'
            'e5a5c3d1716ba9bcdac03e444e99a8a3284fe95694bd8d7b789bd825772532d343d48ec1f106103d8231fa6260a6b60c0bee512e88af064ecfcac9f15a5fb026'
            '3e1b22ac173549bf1d7ad54e608f137ee6fb7ce31b3dc413c6e7ae1851dd3915ac3dec2eddc46da043531fa8babfa737b4f910d0983599c36a9b1b90e190aa02'
            '246618d8536d4961f8584237bc26cc0b820200f551e03e333915692c76016a75c1ef063d553e0bfe854eab6f75f55b4253996ebd216741ea6d82ad0d041c4922'
            '2fd5c325a203afe7270448e56920b139596cc1b5d0648bf7b0501d064137cf62d212fec99cf5cdf79cb604a10d286c8c9bbb623614402e2e24baf0d3bfc4d7a7'
            '7aae2bdba4ee0b85a906c540d5687923112c9cb69e8491c4cc72e4d1c585d8a4643ce0a645e9554e0bd865903aec56aa38eda4f075f0d87486dd713a7c291074'
            '9c7f11d4cd755c91f4581a3ac45c22295b790d9a642ccbc44579ea4d4b4de2d82dfb8932967c3c1a0ec8f0e8a497acc327a0cc49c5b6f2ce9da208e97809cd74'
            '9e20c2659348b83aa1677fe57a7dd8f85efedffcad65183d19120cfbd17ac814f95721fbaa26a3ba19fb6530465002b68e8a301d1ec7f33d2e37934e95e380aa'
            'c1133e8ccaa32b3d4ef5834054b6dd2e529c3b15e5a97ae71c79f311ff89e3ac73f49f542744ff3d464cd9e3a1a707569da5e7e2e3e742d881b6a3b176f938b6')


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
