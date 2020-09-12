pkgname=ntfs3-dkms
pkgver=5.0.0
pkgrel=1
pkgdesc="NTFS read-write driver GPL implementation by Paragon Software. Current version works with NTFS (including v3.1), normal/compressed/sparse files and supports journal replaying."
arch=('any')
url='https://www.paragon-software.com/'
license=('GPL2')
depends=('dkms')
options=('!strip')
source=('1.patch::https://lore.kernel.org/patchwork/patch/1304367/raw'
        '2.patch::https://lore.kernel.org/patchwork/patch/1304404/raw'
        '3.patch::https://lore.kernel.org/patchwork/patch/1304395/raw'
        '4.patch::https://lore.kernel.org/patchwork/patch/1304394/raw'
        '5.patch::https://lore.kernel.org/patchwork/patch/1304393/raw'
        '6.patch::https://lore.kernel.org/patchwork/patch/1304432/raw'
        '7.patch::https://lore.kernel.org/patchwork/patch/1304384/raw'
        '8.patch::https://lore.kernel.org/patchwork/patch/1304417/raw'
        Makefile.patch
        dkms.conf)
sha512sums=('501a8ec4dc303abf2da3bc1a147e8b3f69fb69be3c1487b0b98bf4ce18683741682b97f5441bdd12848b399fa915b3a302c6153add36c8b694980867fb837567'
            '107fb5459290b65a908af5f45ad226dd6402bd1c86564ce82df5d8964431f41edb72d2652dd5dca62b2c6f7eae26f56d28514bb706056ddd3d154120a8853bbe'
            '8a671abc6ede02385710e00996587967b9d1d677b167a936f0cae48bb8b5799075a25954396f6c991e7f126554ccc8f969dd1131beac11c4fd86d7374911f75e'
            '668ce8a830b64af03bd464fb1191f7a32cffdd406e4135bfc1a195acd5737bf2d3c34fa96f279bea23608d4388f1dff3509fc25871f57967ea488951b0bdb872'
            'a02d7eafc9433664e0796e2d707dfcff946e5c0b805364c8b22f89a1d06d706ddb3eb7e037388257cc95510aab346412707a750479f4a9c7b13a8d8aa43999da'
            '9c7f11d4cd755c91f4581a3ac45c22295b790d9a642ccbc44579ea4d4b4de2d82dfb8932967c3c1a0ec8f0e8a497acc327a0cc49c5b6f2ce9da208e97809cd74'
            '9e20c2659348b83aa1677fe57a7dd8f85efedffcad65183d19120cfbd17ac814f95721fbaa26a3ba19fb6530465002b68e8a301d1ec7f33d2e37934e95e380aa'
            'c1133e8ccaa32b3d4ef5834054b6dd2e529c3b15e5a97ae71c79f311ff89e3ac73f49f542744ff3d464cd9e3a1a707569da5e7e2e3e742d881b6a3b176f938b6'
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
