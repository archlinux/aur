# Contributor: Rob McCathie <archaur at rmcc dot com dot au>
# Contributor: Renato Garcia <fgar.renato@gmail.com>
# Contributor: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>

pkgname=pinball
pkgver=0.3.1
pkgrel=7
pkgdesc="The Emilia Pinball Project strives to fulfil your needs for a great pinball game in Linux"
arch=('i686' 'x86_64')
url="http://pinball.sourceforge.net/"
license=('GPL2')
depends=('sh' 'sdl_mixer' 'sdl_image' 'mesa' 'gcc-libs')
options=('!makeflags' 'libtool')
install=pinball.install
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'gcc45.patch'
        'pinball-0.3.1-cstddef.patch'
        'pinball-0.3.1-hiscore.patch'
        'pinball-0.3.1-lacomment.patch'
        'pinball-0.3.1-strictproto.patch'
        'pinball-0.3.1-sys-ltdl.patch')
sha512sums=('d54f2635f583be8a7e4bf3463c69c1ab368e1c069dd7c4edffb95df0448faf7e82ddb8f8607d22a7336e2db176134555ca65b613e9d008b38fecb8ad5a818498'
            '06a152fdb864a7fe7953b24d11241dbdb328606d851945d75de6e9284df5e58dac7f71a14e1ce9211c08e33b89aed7bc128f35567aa7b72ddd4f4e89771c5718'
            '90ab03283023ccefe821de910bcea1167b85e660e3891c3d52c6d2000dd1b3de2b33d3d83d90e8ec5d20142d13eeadd1ae92c26ff4620bd52d87a831aad2cd1a'
            'aef3011c52203bef1c5b0890048f80af5b8156c2cafd675fcf801f26eda17ee03e67dde22390b2ee46bac9b57003d9287bed3589a17f16dc89bd4f7b9d91102c'
            '94eb8e2530a0268f4ab41441a6900ebdf7a6d47378b9e2c9a5d2946d01a8a42bc246e74818d44b71ba756d80c8fcd627f775757804d15deb36db12eab2851964'
            '515955274ebafc6fdce379695b7877906e71c0dfdad1c4c0d6c71e147315ad402541381609d60cd6e14ebfd923942607031de6832e64f96e2de9f5ca01b49357'
            'bcf9ff65d2ac6545764258b7b6039a7688fee6c41830661dc2dca9e00bc1bc4aada22c04ef91e58fdc93077bc163bb345cc282bdae325ede2c10bcbbd43ef967')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  ## Since adding the Fedora patches I've commented this out, but left it included in the source package in case it's of use later.
  #patch -Np1 -i "${srcdir}"/gcc45.patch
  
  ## The below patches are from Fedora, you pulled them out of: pinball-0.3.1-22.fc20.src.rpm
  ## ( http://redhat.download.fedoraproject.org/pub/fedora-secondary/development/20/source/SRPMS/p/pinball-0.3.1-22.fc20.src.rpm )
  patch -Np0 -i "${srcdir}"/pinball-0.3.1-cstddef.patch
  patch -Np1 -i "${srcdir}"/pinball-0.3.1-hiscore.patch
  patch -Np0 -i "${srcdir}"/pinball-0.3.1-lacomment.patch
  patch -Np0 -i "${srcdir}"/pinball-0.3.1-strictproto.patch
  patch -Np1 -i "${srcdir}"/pinball-0.3.1-sys-ltdl.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-sdltest
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
