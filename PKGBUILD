pkgname=ntfs3-dkms
pkgver=3.0.0
pkgrel=1
pkgdesc="NTFS3 is fully functional NTFS Read-Write driver developed by Paragon Software."
arch=('any')
url='https://www.paragon-software.com/'
license=('GPL2')
depends=('dkms')
options=('!strip')
source=('2.patch::https://lore.kernel.org/lkml/20200828143938.102889-2-almaz.alexandrovich@paragon-software.com/raw'
        '3.patch::https://lore.kernel.org/lkml/20200828143938.102889-3-almaz.alexandrovich@paragon-software.com/raw'
        '4.patch::https://lore.kernel.org/lkml/20200828143938.102889-4-almaz.alexandrovich@paragon-software.com/raw'
        '5.patch::https://lore.kernel.org/lkml/20200828143938.102889-5-almaz.alexandrovich@paragon-software.com/raw'
        '6.patch::https://lore.kernel.org/lkml/20200828143938.102889-6-almaz.alexandrovich@paragon-software.com/raw'
        '7.patch::https://lore.kernel.org/lkml/20200828143938.102889-7-almaz.alexandrovich@paragon-software.com/raw'
        '8.patch::https://lore.kernel.org/lkml/20200828143938.102889-8-almaz.alexandrovich@paragon-software.com/raw'
        '9.patch::https://lore.kernel.org/lkml/20200828143938.102889-9-almaz.alexandrovich@paragon-software.com/raw'
        Makefile.patch
        dkms.conf)
sha512sums=('85466ed29b1b7a61a6eb2afe99514c4a88ee08428f790a012c0993854a38746874b6d8c1becd60a36230e39b0cd322c0c6781e5f2e68bf78ace4355fc8f43324'
            '075827dcecdb1c1870ed300162fd4ced8fdd51ed726a803cb882815c24754a11b61464ac46000c6c185e0b76a822f399c10b634f0be3fd52ecadb98da235d5e9'
            'bf58feb40a191009063d8544c6161d726ce07b58313c020766652dd341219e74ede58ec578db7a274307948639da566cd66edccf4a2f5a2a7a4ccbb72320d260'
            '212fda70da6e64926b76260a0e352d41417430ea52ce1d1d0de577c3fbc8ddb7791061b33b835bd86fe346c25398f27814392adc0ecf0081cb9ee403a23a604c'
            '9ee3e220f0071c0f485f585d9eb5cb23b3f816b8d5fd85790c58f70017a2f87d711d0fa941d451c1b1e81559aef5d0158d3da128db1fe65dd44795b2aa5b5ed9'
            'b14dfb6b55098d2868e8fe7f9247224e34568899e8dccad72b85e20312e13e4f846dfa689f0cce517cb9e0aabb13b7a45cdc786bcf1c5eb8c1d5f2731d34b32e'
            'e7a5e6b0a8101463996543ab1eb050dc62a6543827abb57c1fa1609f4ab91cbe5963f9ac261c280261576845c266d161b353e8094b3d349bdbb008f58324920d'
            '363c8768b3040c68a6ad4a60b3df5b459d17060fe5f173b322b35577ce74ae1d3c2e67c45809bc6969421c1e24c83b89ff7c165f986144fe0e54b8d4caba2a90'
            'ab49381b37714bc61b17c5a4d857aac776a674574e8dbd46738eab438eef984b7762430cac05860038d8a875d5538347a1e1176acfd2169d9b5a640a9ef04d7c'
            '5f4087b05eb831fe277f1894240a8d72824daa821317e873f77574fc25d97b273ac3ddd8075d58b96c5e4e441de630817d68a3fa33d6176e26743cdb17ec664f')

prepare() {
  mkdir -p ${pkgname}-${pkgver}
  cd ${pkgname}-${pkgver}
  patch -p3 -N -f -i ../2.patch
  patch -p3 -N -f -i ../3.patch
  patch -p3 -N -f -i ../4.patch
  patch -p3 -N -f -i ../5.patch
  patch -p3 -N -f -i ../6.patch
  patch -p3 -N -f -i ../7.patch
  patch -p3 -N -f -i ../8.patch
  patch -p3 -N -f -i ../9.patch
  patch -p1 -N -i ../Makefile.patch
}

package() {
  mkdir -p "${pkgdir}/usr/src"
  cp -r "${pkgname}-${pkgver}" "${pkgdir}/usr/src/ntfs3-${pkgver}"
  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/ntfs3-${pkgver}/dkms.conf"
}
