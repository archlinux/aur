# Maintainer: Fabian <plusfabi[AT+thegoogleadress]>
pkgname=pokemon-revolution-online
pkgver=0.93_2.20160202
pkgrel=0
pkgdesc="A free-to-play, fan-made, MMO game that is predicated around the official Pokémon games."
arch=('x86_64')
url="http://pokemon-revolution-online.net"
license=('custom')
depends=('gtk2' 'gcc-libs-multilib')
install="pro.install"
changelog="change.log"
source=('http://tiny.cc/PROLinux' 'net.pokemon-revolution-online.desktop' 'pro.install' 'change.log' 'pokemonrevolutiononline' 'copyright')
md5sums=('a1f1608a265a1403783b4db1bc9ce3a7'
         '24f4ddd460f6875bfca2e6622048cc68'
         'b281167bdf0657f84ee1c6391847d370'
         'a1b80b07b2cc4dd068a5e5484ef49649'
         'bc6adb33e9e12239b27200f0951dd611'
         '0efcd0393015ff149217f9ced4670513')

package() {
    cd "$srcdir"
    
    #Content itself without a change because of the license    
    find "." -type d -exec \
        install -d -m775 "${pkgdir}/opt/pokemonrevolutiononline/{}" \;
        
    install -D -m775 "${srcdir}/PROLinux93_2.x86_64" "${pkgdir}/opt/pokemonrevolutiononline/PROLinux93_2.x86_64"

    find "./PROLinux93_2_Data" -type f -exec \
        install -D -m644 "{}" "${pkgdir}/opt/pokemonrevolutiononline/{}" \;
    
    #install *.desktop file and pixmap
    install -D -m644 "${srcdir}/net.pokemon-revolution-online.desktop" \
    "${pkgdir}/usr/share/applications/net.pokemon-revolution-online.desktop"
    install -D -m644 "${srcdir}/PROLinux93_2_Data/Resources/UnityPlayer.png" \
    "${pkgdir}/usr/share/pixmaps/pokemon-revolution-online.png" 
    
    #starterscript for terminal use
    install -D -m755 "${srcdir}/pokemonrevolutiononline" \
    "${pkgdir}/usr/bin/pokemonrevolutiononline"
    
    #copyright    
    install -D -m644 "${srcdir}/copyright" \
    "${pkgdir}/usr/share/licenses/pokemon-revolution-online/copyright" 
}
