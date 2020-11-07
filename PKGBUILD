pkgname=ntfs3-dkms
pkgver=12.0.0
pkgrel=1
pkgdesc="NTFS read-write driver GPL implementation by Paragon Software. Current version works with NTFS (including v3.1), normal/compressed/sparse files and supports journal replaying."
arch=('any')
url='https://www.paragon-software.com/'
license=('GPL2')
depends=('dkms')
options=('!strip')
source=(Makefile.patch
        dkms.conf
        "v$pkgver~1.patch::https://lore.kernel.org/patchwork/patch/1334285/raw"
        "v$pkgver~2.patch::https://lore.kernel.org/patchwork/patch/1334281/raw"
        "v$pkgver~3.patch::https://lore.kernel.org/patchwork/patch/1334280/raw"
        "v$pkgver~4.patch::https://lore.kernel.org/patchwork/patch/1334282/raw"
        "v$pkgver~5.patch::https://lore.kernel.org/patchwork/patch/1334278/raw"
        "v$pkgver~6.patch::https://lore.kernel.org/patchwork/patch/1334273/raw"
        "v$pkgver~7.patch::https://lore.kernel.org/patchwork/patch/1334279/raw"
        "v$pkgver~8.patch::https://lore.kernel.org/patchwork/patch/1334284/raw")
sha512sums=('ab49381b37714bc61b17c5a4d857aac776a674574e8dbd46738eab438eef984b7762430cac05860038d8a875d5538347a1e1176acfd2169d9b5a640a9ef04d7c'
            '794cc6a3f9f00df9c5035a6af2789ed0a01f355a9e53f6940856ebd625ced69ce0b61f841977326c9433a7878196c7d361c90847931832d8fef3c25c1b04a47e'
            '8b1bee77187ce1fceaaaec868739d9650bd4bbe0e5ff54a60f887a8083f94fa2a47deea0f4d25134eeeed542114fe3df10349b5a9cbdb5c855ac23cf35d7fe3b'
            '50e76ddf251c4533125082c7a26e58190122ee17d9c8a722d6541455719a36448f6107d7a23273b6e2d8694d8100559c8c49e887f9c7e797511ccb83f7c39814'
            '17d1e267baca8ba75f5245726d1815e74a2ef8dfe18c6c08118a2f0f125c2ace98ac7ab70d017be51a0fc40236c59faac6813efc523270f52668a3978f1c343d'
            'a64a7865712555889fcc3d7a4b1995bc692efe50bf48124d882c99eeac49d087c8f1c48e80dbae2ccd8fee7617b2266f634fb65398bee74b87825a48322f1ba7'
            'c4d7b55b0389823e52b5a01e3117574f77302e53b2e3c6e613b35b2baa7b2cca3e3cc87028a3423e8b1a7cc51e69e72ce77f370466a52c0cd5e85b65543b817c'
            '67c5b0d58a9c9ae76bc00c05110a16354da9c63f68a22462e58aaa5c559d25f2da04aaa7f7506a4bdf243a058a381712b7f28752fe52a06ad321cb892a41485a'
            'e34c1c47083172b83e01cd05451ce5e87a2685d81a3b31e0a2d52fc09d99c95d53c46e277b5176754ef2d4350f5fd64858726d4f8bdeee7462b119c8f414d3c1'
            'b1c770c2a60992513cfc815669323d2c07bbe4d344428ab2499881b55ed2421c26ad59960aaaf4959470868413e3ec5ecb0d34891e6746252b9265adfc28b074')


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
