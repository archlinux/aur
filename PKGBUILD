# Contributor: Loryeam <loryeam aaaatttt gmail ddooottt com>
# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Zepman <the_zep_man@hotmail.com>
# Contributor: Michael Lass <bevan@bi-co.net>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: reflexing <reflexing@reflexing.ru>

# Instructions were copied from ttf-ms-win11-auto and slightly modified:
#
# BUILD INSTRUCTIONS:
# -------------------
#
# Please note, that usage of Microsoft fonts outside running Windows
# system is prohibited by EULA (although in certain countries EULA is invalid).
# Please consult Microsoft license before using fonts.
#
# This PKGBUILD attempts to download fonts directly from Microsoft, by
# retrieving selective parts of the Windows 11 Enterprise 90-day evaluation
# edition. This only works if the user is allowed to mount filesystems through
# udisks2. This is determined by Polkit, which by default only allows users to
# do this when they are logged in locally (e.g. not through SSH).
#
# If it is possible to download fonts directly, around 200 MiB of data will be
# downloaded. Downloading the fonts this way can take 8-20 minutes, even on a
# fast connection. Be patient. Note that for this method, it is necessary to
# mount an HTTP source and an ISO file as a loop device using FUSE. If the
# build fails, it might be that these must be unmounted manually. This can be
# done with:
#
#  $ udisksctl unmount -b /dev/loopX
#  $ udisksctl loop-delete -b /dev/loopX
#  $ fusermount -uz src/mnt/http
#
# Replace /dev/loopX with the relevant loop device, which is reported during
# package build. If it isn't reported then loop device creation is not yet
# finished and it errored out due to timeout. It usually happens due to slow or
# inconsistent network. In such a case, you can do one of the following:
#  1. wait for the loop device to be created and run the above commands, or
#  2. just run the above 'fusermount' command (doing this might leave redundant
#     loop devices which can be later removed with a simple system reboot);
# and then try building the package again.
#
# A file integrity check is performed after download. Due to the unconventional
# way that the data is downloaded, the verification is done in prepare().
#
# This package uses HTTPDirFS with permanent cache. Due to this the maximum
# download speed is around 15MiB/s. To disable cache, find and remove the
# '--cache' option from httpdirfs. Read more about HTTPDirFS permanent cache
# here: https://github.com/fangfufu/httpdirfs#permanent-cache-system
#
# If fonts cannot be downloaded directly, the ISO fill will be fully
# downloaded. Due to that install.wim will be extracted from the ISO, it is
# assumed that twice its size (almost 8 GiB) is necessary as temporary disk
# space. A free disk space check is performed before the ISO is downloaded.
#
# Please ignore any 'ln' errors when building this package. This is expected
# behavior.
#
# If for some reason you want to download the full ISO file, please visit:
#
#       https://learn.microsoft.com/en-us/azure/virtual-desktop/windows-11-language-packs
#
# This package is based on ttf-ms-win11. Use that package if font files from
# a local source need to be used.
#
# ttf-ms-win11 and ttf-ms-win10-auto are considered to be upstream for this
# package, which is why its maintainers and contributors are added as
# contributors to this package. Without their effort this package would not
# exist, nor be updated.
#

pkgbase=ttf-ms-win11-fod-auto
pkgname=($pkgbase{-hans,-guru,-gujr,-ethi,-deva,-cher,-cans,-beng,-arab,-thai,-telu,-taml,-syrc,-sinh,-paneuropean,-orya,-mlym,-laoo,-kore,-knda,-khmr,-jpan,-hebr,-hant})
pkgver=26100.1.240331_1435
pkgrel=1
arch=(any)
url='https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#fonts-included-in-feature-on-demand-fod-packages'
license=(custom)
provides=(ttf-font ttf-ms-win11-fod)
makedepends=(udisks2 p7zip httpdirfs)

# URL of ISO file from which to extract the fonts.
_iso="https://software-static.download.prss.microsoft.com/dbazure/888969d5-f34g-4e03-ac9d-1f9786c66749/26100.1.240331-1435.ge_release_amd64fre_CLIENT_LOF_PACKAGES_OEM.iso"

arab=(
arabtype.ttf
tradbdo.ttf
trado.ttf
majalla.ttf
majallab.ttf
simpbdo.ttf
simpfxo.ttf
simpo.ttf
msuighub.ttf
msuighur.ttf
UrdType.ttf
UrdTypeb.ttf
aldhabi.ttf
andlso.ttf
)
beng=(
Shonar.ttf
Shonarb.ttf
vrinda.ttf
vrindab.ttf
)
cans=(
euphemia.ttf
)
cher=(
plantc.ttf
)
deva=(
aparaj.ttf
aparajb.ttf
aparajbi.ttf
aparaji.ttf
Sanskr.ttf
kokila.ttf
kokilab.ttf
kokilabi.ttf
kokilai.ttf
mangal.ttf
mangalb.ttf
utsaah.ttf
utsaahb.ttf
utsaahbi.ttf
utsaahi.ttf
)
ethi=(
nyala.ttf
)
gujr=(
shruti.ttf
shrutib.ttf
)
guru=(
raavi.ttf
raavib.ttf
)
hans=(
Deng.ttf
Dengb.ttf
Dengl.ttf
simfang.ttf
simhei.ttf
simkai.ttf
)
hant=(
kaiu.ttf
mingliu.ttc
)
hebr=(
lvnm.ttf
lvnmbd.ttf
ahronbd.ttf
frank.ttf
david.ttf
davidbd.ttf
gisha.ttf
gishabd.ttf
mriam.ttf
mriamc.ttf
nrkis.ttf
rod.ttf
)
jpan=(
BIZ-UDMinchoM.ttc
UDDigiKyokashoN-B.ttc
UDDigiKyokashoN-R.ttc
BIZ-UDGothicB.ttc
BIZ-UDGothicR.ttc
meiryo.ttc
meiryob.ttc
msgothic.ttc
msmincho.ttc
yumin.ttf
yumindb.ttf
yuminl.ttf
)
khmr=(
moolbor.ttf
daunpenh.ttf
KhmerUI.ttf
KhmerUIb.ttf
)
knda=(
tunga.ttf
tungab.ttf
)
kore=(
batang.ttc
gulim.ttc
)
laoo=(
dokchamp.ttf
LaoUI.ttf
LaoUIb.ttf
)
mlym=(
kartika.ttf
kartikab.ttf
)
orya=(
kalinga.ttf
kalingab.ttf
)
paneuropean=(
NHaasGroteskTXPro-It.ttf
NHaasGroteskTXPro-Rg.ttf
RockwellNova-Bold.ttf
RockwellNova-BoldItalic.ttf
RockwellNova-ExtraBold.ttf
RockwellNova-ExtraBoldItalic.ttf
RockwellNova-Italic.ttf
RockwellNova-Light.ttf
RockwellNova-LightItalic.ttf
RockwellNova.ttf
RockwellNovaCond-Bold.ttf
RockwellNovaCond-BoldItalic.ttf
RockwellNovaCond-Italic.ttf
RockwellNovaCond-Light.ttf
RockwellNovaCond-LightItalic.ttf
RockwellNovaCond.ttf
GeorgiaPro-Black.ttf
GeorgiaPro-BlackItalic.ttf
GeorgiaPro-Bold.ttf
GeorgiaPro-BoldItalic.ttf
GeorgiaPro-CondBlack.ttf
GeorgiaPro-CondBlackItalic.ttf
GeorgiaPro-CondBold.ttf
GeorgiaPro-CondBoldItalic.ttf
GeorgiaPro-CondItalic.ttf
GeorgiaPro-CondLight.ttf
GeorgiaPro-CondLightItalic.ttf
GeorgiaPro-CondRegular.ttf
GeorgiaPro-CondSemiBold.ttf
GeorgiaPro-CondSemiBoldItalic.ttf
GeorgiaPro-Italic.ttf
GeorgiaPro-Light.ttf
GeorgiaPro-LightItalic.ttf
GeorgiaPro-Regular.ttf
GeorgiaPro-SemiBold.ttf
GeorgiaPro-SemiBoldItalic.ttf
VerdanaPro-Black.ttf
VerdanaPro-BlackItalic.ttf
VerdanaPro-Bold.ttf
VerdanaPro-BoldItalic.ttf
VerdanaPro-CondBlack.ttf
VerdanaPro-CondBlackItalic.ttf
VerdanaPro-CondBold.ttf
VerdanaPro-CondBoldItalic.ttf
VerdanaPro-CondItalic.ttf
VerdanaPro-CondLight.ttf
VerdanaPro-CondLightItalic.ttf
VerdanaPro-CondRegular.ttf
VerdanaPro-CondSemiBold.ttf
VerdanaPro-CondSemiBoldItalic.ttf
VerdanaPro-Italic.ttf
VerdanaPro-Light.ttf
VerdanaPro-LightItalic.ttf
VerdanaPro-Regular.ttf
VerdanaPro-SemiBold.ttf
VerdanaPro-SemiBoldItalic.ttf
ArialNova-Bold.ttf
ArialNova-BoldItalic.ttf
ArialNova-Italic.ttf
ArialNova-Light.ttf
ArialNova-LightItalic.ttf
ArialNova.ttf
ArialNovaCond-Bold.ttf
ArialNovaCond-BoldItalic.ttf
ArialNovaCond-Italic.ttf
ArialNovaCond-Light.ttf
ArialNovaCond-LightItalic.ttf
ArialNovaCond.ttf
GillSansBoItNova.ttf
GillSansBoNova.ttf
GillSansCondBoItNova.ttf
GillSansCondBoNova.ttf
GillSansCondExtraItNova.ttf
GillSansCondExtraNova.ttf
GillSansCondItNova.ttf
GillSansCondLightItNova.ttf
GillSansCondLightNova.ttf
GillSansCondNova.ttf
GillSansCondUltraBoNova.ttf
GillSansItNova.ttf
GillSansLightItNova.ttf
GillSansLightNova.ttf
GillSansNova.ttf
GillSansUltraBoNova.ttf
)
sinh=(
iskpota.ttf
iskpotab.ttf
)
syrc=(
estre.ttf
)
taml=(
latha.ttf
lathab.ttf
vijaya.ttf
vijayab.ttf
)
telu=(
gautami.ttf
gautamib.ttf
Vani.ttf
Vanib.ttf
)
thai=(
browalia.ttc
upcdb.ttf
upcdbi.ttf
upcdi.ttf
upcdl.ttf
upceb.ttf
upcebi.ttf
upcei.ttf
upcel.ttf
upcfb.ttf
upcfbi.ttf
upcfi.ttf
upcfl.ttf
upcjb.ttf
upcjbi.ttf
upcji.ttf
upcjl.ttf
leelawad.ttf
leelawdb.ttf
upckb.ttf
upckbi.ttf
upcki.ttf
upckl.ttf
angsana.ttc
cordia.ttc
upcib.ttf
upcibi.ttf
upcii.ttf
upcil.ttf
upclb.ttf
upclbi.ttf
upcli.ttf
upcll.ttf
)

DLAGENTS=('http::/usr/bin/true'
          'https::/usr/bin/true'
          'file::/usr/bin/true')

source=("$_iso"
        "${hans[@]/#/file://}"
        "${guru[@]/#/file://}"
        "${gujr[@]/#/file://}"
        "${ethi[@]/#/file://}"
        "${deva[@]/#/file://}"
        "${cher[@]/#/file://}"
        "${cans[@]/#/file://}"
        "${beng[@]/#/file://}"
        "${arab[@]/#/file://}"
        "${thai[@]/#/file://}"
        "${telu[@]/#/file://}"
        "${taml[@]/#/file://}"
        "${syrc[@]/#/file://}"
        "${sinh[@]/#/file://}"
        "${paneuropean[@]/#/file://}"
        "${orya[@]/#/file://}"
        "${mlym[@]/#/file://}"
        "${laoo[@]/#/file://}"
        "${kore[@]/#/file://}"
        "${knda[@]/#/file://}"
        "${khmr[@]/#/file://}"
        "${jpan[@]/#/file://}"
        "${hebr[@]/#/file://}"
        "${hant[@]/#/file://}"
)

_sha256sums=(
'fd46a547002d330f48855408609eb47c22a8c269fe01e3d183e7ca98397bde77'
'be80e1246047a6489a2573c6426519c7cfe0d08c1669dd81c43bb67d39482a19'
'a950894abb1ceb1be0d9460b26e5a6167cafc3fc3330eab7f6b21db8b96cd080'
'eda36eecde18b26627f4abcfe5ccfaae65da43edb2c47e7e631b30b3a6fa8af8'
'356495b9b8fbe3b8818d8ea8602e9e28bf94ac4134d7c6c2cc3c33639ed36718'
'a6acf69a7a6e8a4cba014266036eca8629560038cc50783f46917748fabefbe5'
'aba1579ef29ec6e9fd4a5576c0065b4fa8546450bee7918ace96979fb6d029be'
'cbc7b9539a176da428ec0755a8073e86fb7a97a90a17469aa8be40d850e64206'
'3a1749a8f64fa56dda7ea76194b55cb6a37b387099f16d72458f7e340c5f4d6e'
'8231f49a026c7cb4eba3e8f5fbc8331e6a53a5bdd59964ee9d36cf45b37e26ee'
'19cf85b190ef9cd121926554b1656e4edcdcd423f1784273da01e05e5824e712'
'6b6c663b1654d4116e1c3500e62e0b48c07c0625a1cfe36dca1fd419a6067c30'
'a1cb96ae8168edd2795c068501cb7a1d3df7265de37771d90147241528fac559'
'6df5d5164191a413dc83ef3934041398b52692a2def9ed2030d6328c5d3dbeea'
'21508a0305a83376f7d23cacb76c802a1c3305ac2f73c4e0b4c988946ee7e400'
'6d8b9c3629f7c56b9107ffc94eb5054e602a90068d3bfd2f5f949ff5447dc212'
'ac52eb7e57b0dea829ceb6d476566faf42b9d435f0fc1f97d55a75459be0acdb'
'0a10b51acd4f8c45459af5c3e160c65fa870749ab00c893361a77612b0be1377'
'b397c0c0cd3fa823614d46fba21e911b1dbabcc33c63f88cb2b7e4949254e798'
'd969aec8611220f29a51e2fe58ba43d650e76a9b865fe9b5c9fa695c4c038592'
'd3c37c04314c6d2cd4949119ce1b979eb029af3979dd9c366f1b8097b71d47ed'
'c7a90d300a722fffc5a83704f81090e786633c4db86ffafcf9a0b0ee96246120'
'277465a30f5076bb71afe28fdf7da0f05a65ffd505e9be8b83f46c01dccd414d'
'ba6f0cd51ea9efc4d8fbe24ee0345dd65975ee5c3ba8724a160eee5c78bb7bf4'
'9721a77067ae3cfbfd72009e86a736e24ad1c505da776db7353913f55c2e87ea'
'a7b617f83c3d969ce16be91b5fea4155c1180eaf86bfa63f5f6945402b36efbf'
'eb90e62e98b570df10d99bbf32ee94025e4a9743bb4010b984fbbbe5b13ff418'
'8d5e91944a4e048c6167bb29c76ccf5740172b36d1201bf29a73afd8489fe164'
'819e614972126b01c3f75bf1b2aa89c59270788c47582782315bcf803a832924'
'20316d16c79d7c48389d2342d88bac140029f61b9003011f4fa0b159c534590e'
'8d24f28334c99fa903795114be7336ae0f49d68388498198c6b81fcc8123d05a'
'2b93956bfa8af7907388be83b8a06c190ee47dc0e7b53a099b0a48f88c5fccd8'
'101ae78fa1d91abdc629391d6bc7d5ee3421e3bc8640a0b5f4e17b20936be8e9'
'2a186f9e29d246b282645f963664b04d99dde16f7b8f8e5e5cf2c230f620d6d5'
'efd0c380676a4e49af7f2c2a8cc2f20a8727903609cdc1a26853eedbbb9611bf'
'5efde17f7a74655c34e29d8d88fba2caf261d1dcc7b828615653976b7c0ed0ba'
'df26828a562643bcb8e9b4d757d47e0213998db0f35e4cee08ec5ff5f87fd431'
'5ab73bd7957d0ac0b5cacd18ebcf19af6d0718da081c8c6942726f94b3c408bc'
'756d4b800772da4ba298a6ddaaa6b3aa8fc68b63a1b20e5999b98f64122a3fdb'
'08900f011f18f184047044bf4087857d6842d7f7126c0b88035447ba9bd37e30'
'8ad214f1919b2cb8a7583cf2019a4e72bae182dfce0b5738c1780b2ab62d8f57'
'b7d31a1a0b8b26ae3233044e646a4ce37061cec96a265ecd00f4c57d3cbba58f'
'9b513ddff9dc34b31cb8e93e48e5db9ff7ef0aad18abc1b4da2c0bd800cb7bde'
'681f35684afe5d945691d2c45d7f025e5b7e1a3e2f504ec298cd9b59be3b689d'
'4df3d3959c7d9a4c708052d99b0103ed076015a9dde160f9d32a7c520c960fd7'
'9b8dc4323dc148795c5737a7a036f2bade5978eddce975ff6e1c180010770f8a'
'0a8a88f66122f92bde4e128fb09d2cbad0709372e1887bca86c61fc845c8f846'
'3faa1151ad1223e67d5239e1a720dd393852eff0b14e1738afce9b2a4f73881f'
'a679d8abfb4e2604aa120a2c5a0e64885a175a8b20aa4278820ad699f1f6f19d'
'12e8f0c460e8ce547822cb81dd4576497c0fce7f999def6066275a8723c1c8d1'
'b2cd4d6d863303015403b042830d13571ed04466fc37fb2e62b4ce8b763b9331'
'79127ea561e584bac407a13094840be7d01f9b367ec3a085a6dc9c99c55d9c57'
'3eea7179edd165ca1fe484873992c2cc7a464ac5455187b4eab7f21ed7101531'
'86e920262186f7bce252da236fe2390ad899b833fc76079fa927b8eb43d93e71'
'9e673dbabc23a65a102a24afedb6e69d0cc3c1a7f32f54cb30a269de7645f814'
'd7a89012876127f1bf9938aa5278ec8a439e2b4b54f33093240abca8c135b29b'
'11fd393dec8b38813c38562253ef5c33bdc8ad7e0272f10ab2da96f584b07fcd'
'6119dba806cb36feb47fc5526ff77a3f20b074320293308c2479c21683c059f4'
'd70a6787ceead297c17ea5ae0fa91dc2820e457247bd189c1bcdee960714c178'
'e32c2c5fc9e2a1442f0c2a644eb569da1c299002a19646eea7cc52f8b2e48726'
'ebbb8c5ecb4c54709f1fd0a5cbd1ff85095284ca14d4ce918824b1b4323583d6'
'08d0b28ea2672b69ef3ce974cedac03fb93718bbfc44a145c3b6eb14e0ee8fbb'
'8cd1347126ff73a389bc180cb3cd89e943fb8562a89aff1240df988bb3a90cfb'
'4bbcda89375cac003f4fea06ec83934716cad0c63061447cc173b7d5c363b5be'
'd24b407201bd5f95c7e18f8161e00e3371aa4a0c64e1f08cac7afe35e7d1a025'
'a379cbb1d88efa19a03e38a50eb7f10245d5dabe654acaae23908e5180639a11'
'cf9fdfa376dc2bb66921ffe09591aa10add64bfc4779e223a396e39f23be5f6f'
'01eb2b1566f6b339658c97068d063d7de2ee2948d14709d9d3994c2c5ccf3838'
'a210518d99798c36869e686b0fe2b2fc16c0c5935c58033e4044935f6fd9e2f0'
'2aa45686653f0440d130f96c9520b32d1f40c328c1ac35efc47c0f9fe9bf1ec5'
'dc6caa7f3602807f5e989e6784e6376cd5d68aeb824a4c2432a0532c4a402546'
'd89c60cd47139df9f2ed9da25373745093c8083b60bab7be2b58c4889d6c7dfa'
'3a82a38db99e10d6f1ae76c76b3f2577f53504b295f851620138f1776cb0f2d2'
'd5dc8ad7ca34a756dfcfe4820954ef94730f693adabaa188da85cf23309e4bf2'
'317eeb886d0db46596d211e398f64c4a1df8f9707e66ddb4d4b3c3b8faf80899'
'76bc67b2b121b434e797f9fcdeebc2054fe1dc13341e8394dcd07786aa02c638'
'eabd7553f81c3f6dd3e1a19c99ae42507a671c5e43e209079e5126e56fbd012f'
'3434e1afce64009242304c74fee161b99d11d813440cbda7cb73e97eb45b62eb'
'7c3f899e07d771322c2155b3482e73b7a474f5d6b5262bc537d103ce3eb1950c'
'a015cf70b48ed882b7d95c91fa0d3c3a458c711fd5ac2eabc97da50a0e2b6f1b'
'30c983cea22859619f8dcb53857ba728ca74d82ce646207caff31262ec7f40b5'
'02c2765ce36754c68c0445b0fd938a669b957fe8497f805591b6928b01573029'
'8b7cc61a64647ec3dabc0fdc91c412d39dc1a7269277e54e1159070456f4efbe'
'a2a54053c23520b95236416e2b001bd488ebc8c75e6c6436a70edacdaaba1cb5'
'f91f3f796d00452aeb95fff4a19491c35b1c40499ba537a90367bf58b92ef828'
'c0372c8f7ac42e4f1890e994543b92b4d5949c578f1fa11e3ffedb38d05f1e82'
'9861194ddae2b487c2cfde9d716f8c6d77bc7cdd9b0e38ae75b650f0b89b8546'
'ec065febb1eb31e9396d18b0694bdcc6af69cb5fbc5ca7771a3e1484b71988f5'
'80550cd00894ac00e8d35ce61b8d85fb277c7fceefd239052eb1360456b79019'
'33c6cfa3b3791a5d2a8f0b986f818ea367987eb27e462f30fa3f0b36adf0a393'
'9acfae05976aa6b4b67a1a4c385e0532b65c7c459b81d185634b5409f71468f5'
'8818c1183fb5451d64eac41a8b3780dfcd6fa640d81c7d250b0cf2e6553c598b'
'250a96a0cd1c257e9711cf22908028d4fa2a02b0f3accc5e2ee539dfb7f81137'
'5eab0bce6cd324a198f04b079583c20383a7ae8c88c55d1da969a9c41a16635d'
'7c253ce5601cf342116af85a6f61ef2eda016a669142e2909e8ed54dd626cf10'
'a62ccd5002d2c59906878a9d731bc42364144116520a8f1d2024da6a2287d01a'
'69503ce641b265584f671ff9bc763e1740ef95bc47860d651de919c80a3aba81'
'6ee3a6b900f7459ce05a6a99e38a732f15536e6e4be5a1f7a463660dbae8a808'
'c2e2d45ee00c8372e33ecad0049a158841d3c8ef81a24d827ca45680f3239084'
'b338139558d3c80ef04438f5586bcaec85b8896498dbe8e325ea57455263a938'
'5a70408fa429f51a5b4e8bd0a0c554bf943a2424b79ac390808cc1a73cf86657'
'0d5336136a4ef54393ce1ed590158b7cb4414193763ff062f7d0f1bb004f9650'
'adb026155384086bb80fb9b3925993043a2708a811da6660f0024810e8cd77e5'
'763db1e894e528b55e064e66211c750f9a9bb6bab17da36d65884d0ca773e00c'
'bae5736c25cceb91ea2dfed060a19beca954b3da617544379a4714893076bb31'
'd845bacebd9dd283ba8fb9dac0e7109afbc065975637b557dffcc9bca6654810'
'330e4ba7d299b071b37ea6409b33900eeb7dd0bb3e4ac57223fd6931d1c8cddc'
'b6a0c456c69a8c662525fd65a19b1988800880f96accb4844f70f65917f0251c'
'ef9c48661c2c9d4ab124e1a0f7597f38f64f6f21fb6550e44cc7c33a5045a541'
'd71cd8d4cf5440e58067aa07e50bb959f9515798b64d4b716c484f1816f641ae'
'1adfbd7270a43b3b6d896692f81814c4bb248bc0c7b905e98f69cda02c2bb04e'
'9718464e272e1fac4b758a707c7270bbbc80020d4ee0e4a99b096e830561f651'
'4add7a3090db51193237b67a5cc6014b1cd332a10d5745974e0f56214c1512f9'
'312206ef84f15a6c953d6476b91115fd6d39216ec0778fee72e7dcf8910eec81'
'd59892ef756fbf109d8b8a76a2e1d949491499a7483f82b094264b4703818b47'
'e794f45ccb930fc2483e5eadbb052b3a11185209faabff5b605df2d700b1c300'
'3e8c10ef6c25f21d61ab5fff0afcdf3bf01ba2abea280590b60836f7e5091de2'
'320286347586bdcb5f86546681fa0cc2cbb8b16097d387bb81a01b4a9fc87d77'
'64fe5ad4cd9127b5c23bbd8fc2bd79fb808ee277b03f6e6691314b9f26c1dd66'
'a85836cf30551bcca3c42b6d065f533627e1d23a8fdefcead55816b71ba5543b'
'331409c9a1ea1ba780c9429b25433b073d0e34c924800998bef014b89f1b2943'
'f7ddf8e410d6738019764398f002cc014e8357712af3f38a5f17837758af60ba'
'7f7d620849ef4c8057fbe35b1510d11457efa1291298e516b533c1c684fb9a83'
'fb06ff2368ac10e97f475ca7fe2b2e4f9be4be4e9853ff3abd0ace5cd6f5f136'
'3e9adc4b4b476351852bb7025ec8674a427435781bbf09be59a06b06e530ee49'
'c8ad63741417c649743256e2c4cf4a6ffec09ccf8692871c0e4499184c9af0a2'
'07110ebc8b5cb61d9185f49ff11a076a4683dbf6ffefb771e539c8cf7780df21'
'4078b74836d792eddfa8e176e9868a111b0c5e90da852b318eef5a6615d80d0d'
'2cbcd009b344ceef57ea19adcbcb604117a61c5413082eb7fa35fd8ef4bfa9eb'
'2cb4bb0803e24bb2456d92ff059ff40720cbfa40cba6660337baa4a53391df3f'
'eaec98c18c9ef61f2ddffaa82aeb4a63f4c6c340cfa9f0d0c4ff099bfa6177a6'
'546d4189561a0d6a402359e3d6751d93bf0f16ba347c10ce55cd3b59a77f63a3'
'123c47ecc276e2776ce7db6b533ef6cdf913bd741ff11b29c7423cb9814407be'
'a25890becbba17c1e6eef1ce532ae45c016fae6f75fab9003ae52638d31d45ac'
'5794ad5a201830bc36d2937c9a6bf4afaad50439378a83f368b1f8f97a069241'
'945aaaffbab5505d05748299ff0bc96aabc62c48540826af2735d2830b93c7b1'
'5df8fbb6d1cadbb2d2c74d3e56931bf5aca635644c1b336d157603a22da1df89'
'dfb7873f9dee6650ea7b6b74241db0ab50d81ef4b9096dbf2500d87d2ed27624'
'720468834477feb81288a7d0e693291ee39064b1567a058f622702f9aa960841'
'c51809bd5224fdee918be220e90616842d7415e8b3c45d03adcc926c04a9c4f0'
'4199fc21d5af09fc3fdef2a7cdac52231aaf0c11a8d77f8285bd2006d984945c'
'913c42e0ece5ef4ca60f902b0d248ab10d3d794cb230a5c00a3f62bebb91224c'
'c320242e731ff493652a1f37b4338dadfdcc43a95c0305bbaa955631c75eda83'
'0d4ed308cacb3ab3c1bc37a603839b41b6796a5ba50e45993f447a2507f3e2cc'
'44ba03567615970c1e3aeb71741a0c332009e706df2a5106dfb5320240e6b613'
'4f1d1dcc55c47cd0d696b68f0ca823966b0a9999ce980a6ec3df02cdf5c1db5c'
'fc3b6db70e1e11bf375d315fce8890fab5e7679391dbe6c69d6903bfcc069748'
'b697ea6f40257429150ee94241519593f9c1e97a4a7b960215a63a603104e67a'
'7f5c69d29f1369e06fe2f3b335c51dc5a268eb92e4f6000ab5926dc9a69503bf'
'058d1645d8da963d9a4b8fb6de27a9b6f5c8b787785dcb67e2370cde785c9da5'
'f7fe8aaf824b375ac18d98ce9e9fb021eaff524d7e92ac0e295208b5fca32089'
'2a26b4bb61d7be49a52f8b124f98a009552a7b05fc97800a9873f187f70f455c'
'0c3801d68337cf4ebe0ebced46c40d72a7951a5cfe5d7ba9f9562d665a0b3c8d'
'6fa1bc7f2399ac0acfede5f8316e1b143af519d6c01401a78cbd1b3d27fa97a1'
'6e7dde971417ddc1f58864b14264bbd22cdacf7e0e3894371fdcf260576f0a54'
'eeae9d08f1a69d3ca1d2b54ea460554d0dc75b96fd5346e71a71af20314cb6bb'
'1e5d405d4621f55f99f13f79f79de8102ec7f8ca10f0e0e59f165f127148afac'
'61859e1adff89b3d99191d00297fc4bfab05b86a56b6a08bf4a7bad4d24c9bb6'
'23a0fcca89e8a8d0a0caac612860a7ca719fc2a641c47a3ed085c4e4922c2574'
'b977a179ed4cf98129bd4e4682e0e965826bb36ede755bfe9e9410f555b93740'
'aa323dd23a2d55e58e44995af7d3f3b5425d226967aafc3d82fccd84e6902811'
'515de7af577342c97e8d9329eb1f005de225e9e380a0acbcb3d114c140c191bf'
'c7866235d9207ccb6ee32b0608100c2bfc6c5bc6797c6554daed6214ebec5c5d'
'8d9d678176cf788c6b5f8a8cca189c4315a1a9efd012172db52603ef4c31796f'
'945f0a5eadd23ad320f6dd1ac16fecb5bd4247700da070ab701b0b6860ed297e'
'6da59e3007d6af65e9449740485500986c227f798c9f2eafe8335e77a3262389'
'19eba86384f0279648e12083171b5aec821afb782bf5ccf5486ce7c243f636a3'
'f751ccb6dbc928fe536fb5496a017d9c6252d2904a756eb9297334bd1b5bc36b'
'9328a01c72d0129d4ba193de2ec6c6e8412a32c826860818568bbb6da52dfc09'
'751f085a4537ecba0b877770f877016622e362f937613a5f856a7ba715df0ff2'
'6a4e506fb809b4377d9696494c6e121914d79df6e72e4ac82753822f8d6622f9'
'2c64781512627d8c43135b329f82b80edc1f9eb444be3c2bbebfb3cd0cb172f9'
'a5e5778d59494514f7a74a56a4ae435ba7bb6771acbfc717b2128855d7207d3a'
'90795cdbd86b0e5c251370d1bab51753f656a1494ecb07bde82b397125d27ef3'
'398728876df03a2296f1d1620c219d012613dd3dd698364d1f00b1e79aa7a03d'
'dc9060725f6489497e24d97b5d7e254f42e9e05567ee8f1f31f7b3fc63009ca9'
'c4804c91224376f97bcab37083103c02fed960fbbbafa29420ac0fc1fb356b00'
'24ecc028331cdcbe4e0d090d6b5d66db9fa8978c1d6e652f99c30bf4bd5210f8'
'39d47e9d076c26287c04a24ab3f3b3dd26af903f962b67fa67c940c8d646d0bd'
'4dbdbe1b4507b2b4d092245e6ff0787bd43bad4a3bbe77bad860fcf7a3ce706f'
'ece8cbe4f7afa680e05231fd46e519d14057d06d3d11c5ef6bda1ae32b2bb5ce'
'51d9a8d4205239c865e24b6eb7e6e6dbacfd59c3e2c46f623db0af45e169c9d8'
'05a38ff214ee932c6147a4e697b494040fd68ce654795f10f723c01d7bb8ee12'
'9309a1d4343801fe85406e9324ef0ec8f82746c51d6d5e41f5cbb780f94e6a2a'
'74691732d0aa9b34c88b8d020d6e43e66b207ee0b25584c60bf81c471a414c4b'
'324474e3547086f33b4227ebab8a2f3094b8cba90ae0991a5196c91729f5bccb'
'3e236130c188e672fcf416b72655caa2b377accffbc30029b6540cc04699a08b'
'46c67d8e32d2cb0dbb56c491ebf06435f8f6fcbae7fbc8070b97936e288c8bd3'
'9b0e5c299c60fd352762b8baa07429734bbaa06f2fd0ba1ca33add3678a6600a'
'f3a149f2459f61a4dc310e3f2454f068cded470ef886cfe39969c92f9a95c847'
'5cbf992f1c6590f30cb62e5871b781e8e6a6c8e9a42fea35eb76b52bb5c3fc5d'
'563e3e2a3baa7c2681604f6a654d5f7353ef654c3cd4cce17caaddaa884f5f84'
'6a00072387ec6ec94eaaecf2520806749945a68ef9d81af891dae8223af36484'
'ddcfc7ab74c8bd08b397d4677f7604b4ea9df66a8c22917ccc8d50fa0824d4c1'
'457b306f719a002f1d037b2a3942f2abfa8a55d7bb109bf8950341a3129adb46'
'7d54f5a6a4202dae7b54d5a854770cb4fecd33f8975c0996e89c6ce31f4b0808'
'4bde3e6392b96910fb59094c6c1a4dbfae18fee78d0bf13dc30616837c4f95db'
'ceb8d745001f56b61ce768d84172d35bdf68e498423c9320dcb22e7c900944c2'
'6d16c4f4f33f42f2d427857c207f732c5cd56bad43e31ad435b18758dc4758d7'
'4aaa147e17688b9ab3937d4a90f8559e93e9326ed29690b8f14aa71515c3eff9'
'a907d9169b20a52f552a7be3f6b65c5d734f41cb4257079671bdf258d72a7f11'
'ef80de39ccc3e62677100f8d9afc0dca88e0c672ebdaa927f64eb4c997dff1b8'
'eb38e0dc76405b52d5f231f4317f2d345627c7fdcfa2a465f0564fa0b6fa37c5'
'c7422abaa2aad14dd1050fe7efca637a3f3ef1e81b5a5a311935653ea07cb803'
'6de498b2ef2fd7c87a62aafedd7473d95919faaf6a9dfa7557bb45f38f70490b'
'02106cfb319ebdb7d3db30d5d8ecbd5def0225d4445932b56b00e6b509a39308'
'60232ab659a84fd42931b2e799d18892788e3b7132259f4c593b92780a4b3545'
'4b6ef4d01d25efc221e790d49d86461addd3cc314a70039b1f7be6c11def7b82'
'8a0ca710b27ef0bdb23caed1b8510d210833b622f93115af56d2f103ef8608d6'
'999036a4cc3913a6135840e9ee65642a997370978bbadd07849e088ea902770c'
'eaf277e294f14192281ac12a7f624ff85b707741ba8ceb5d41e5817988f2b395'
'c488427dfa955b8d2c705141259d38eca410d5844b3b66ae8538d487aa5e880e'
'f0829cbc0877c03ac2800840c2363c264b32f0ca9da53cf0d0dd1510f5071c71'
'd5cb3539cd9cab3d38fccc5e04c42b6adc11d7dcf87bea624f1b269c6c360c6d'
'd7857c403c7c79a4de93a11a22c8b0fedc077762e173a8b80b950c0b1e9caacc'
)

_totalSource=$(expr \
  1 + \
  ${#hans[@]} + \
  ${#guru[@]} + \
  ${#gujr[@]} + \
  ${#ethi[@]} + \
  ${#deva[@]} + \
  ${#cher[@]} + \
  ${#cans[@]} + \
  ${#beng[@]} + \
  ${#arab[@]} + \
  ${#thai[@]} + \
  ${#telu[@]} + \
  ${#taml[@]} + \
  ${#syrc[@]} + \
  ${#sinh[@]} + \
  ${#paneuropean[@]} + \
  ${#orya[@]} + \
  ${#mlym[@]} + \
  ${#laoo[@]} + \
  ${#kore[@]} + \
  ${#knda[@]} + \
  ${#khmr[@]} + \
  ${#jpan[@]} + \
  ${#hebr[@]} + \
  ${#hant[@]}
)

sha256sums=($(awk "BEGIN{for(c=0;c<${_totalSource};c++) printf \"SKIP\n\"}"))

prepare() {
  echo "- Examining locally available fonts"
  for _font in \
    ${hans[@]} \
    ${guru[@]} \
    ${gujr[@]} \
    ${ethi[@]} \
    ${deva[@]} \
    ${cher[@]} \
    ${cans[@]} \
    ${beng[@]} \
    ${arab[@]} \
    ${thai[@]} \
    ${telu[@]} \
    ${taml[@]} \
    ${syrc[@]} \
    ${sinh[@]} \
    ${paneuropean[@]} \
    ${orya[@]} \
    ${mlym[@]} \
    ${laoo[@]} \
    ${kore[@]} \
    ${knda[@]} \
    ${khmr[@]} \
    ${jpan[@]} \
    ${hebr[@]} \
    ${hant[@]} \
  ; do
    _allFiles+=( $_font )
    [ ! -f $_font ] && _missingFonts+=( $_font )
  done

  if [ ${#_missingFonts[@]} -gt 0 ]; then
    echo "- Fonts are missing"
    echo -ne "- Mount filesystems as a non-privileged user: "
    touch test.mount
    _unprivilegedMountAllowed=false
    _testLoopDev=$(udisksctl loop-setup -r -f test.mount --no-user-interaction | awk '{print $NF}') && _unprivilegedMountAllowed=true
    _testLoopDev=${_testLoopDev::-1}
    udisksctl loop-delete -b "$_testLoopDev" --no-user-interaction
    rm test.mount

    if [ $_unprivilegedMountAllowed ]; then
      echo "allowed"
      echo "- Downloading fonts directly"
      mkdir -p mnt/http
      echo "  - Mounting HTTP file"
      # Remove '--cache' here to disable HTTPDirFS permanent cache.
      httpdirfs --cache --single-file-mode "$_iso" mnt/http
      echo "  - Creating loop device"
      _isoFile="mnt/http/$(echo "$_iso" | awk -F "/" '{print $NF}')"
      _loopDev=$(udisksctl loop-setup -r -f "${_isoFile}" --no-user-interaction 2>&1 | grep -oE "'.*'" | sed -e "s/'//g")
      # Wait for the loop device to be automatically mounted.
      sleep 5
      # Mount the loop device if not automatically mounted.
      if ! grep -qs $_loopDev /proc/mounts; then
        echo "  - Mounting loop device: $_loopDev"
        udisksctl mount -t udf -b "$_loopDev" --no-user-interaction
      fi
      _mountpoint=$(findmnt -nfr -o target -S $_loopDev)
      echo "  - Loop device mounted as ISO at: $_mountpoint"

      echo "  - Extracting files from online Windows installation image"
      7z e -aoa "${_mountpoint}/LanguagesAndOptionalFeatures/*Fonts*.cab" \
        "*/*".{ttf,ttc}

      echo "  - Unmounting loop device $_loopDev as ISO at: $_mountpoint"
      udisksctl unmount -b "$_loopDev" --no-user-interaction
      echo "  - Deleting loop device: $_loopDev"
      udisksctl loop-delete -b "$_loopDev" --no-user-interaction
      echo "  - Unmounting HTTP file"
      fusermount -uz mnt/http
      rmdir -p mnt/http
    else
      echo "not allowed"
      echo "- Preparing download of full ISO"
      echo "  - Checking free disk space required for download and extraction"
      _freeDiskSpace=$(($(stat -f --format="%a*%S" .)))
      _downloadSize=$(curl -sIL "$_iso" | grep -i Content-Length | tail -n1 | awk '{print $2}' | tr -d '\r\n')
      [ -z $_downloadSize ] && echo -ne "Unable to determine file size of:\n${_iso}\n" && exit 255
      _requiredDiskSpace=$((${_downloadSize}*2))
      if [ $_requiredDiskSpace -gt $_freeDiskSpace ]; then
        echo "Not enough free disk space"
        echo "Needed: $((${_requiredDiskSpace}/1048576)) MiB"
        echo "Available: $((${_freeDiskSpace}/1048576)) MiB"
        exit 255
      fi

      echo "  - Downloading ISO"
      curl -JLO "$_iso"
      echo "  - Extracting Windows installation image"
      7z x $(echo "$_iso" | awk -F "/" '{print $NF}') "LanguagesAndOptionalFeatures/*Fonts*.cab"

      echo "  - Extracting files from local Windows installation image"
      7z e "LanguagesAndOptionalFeatures/*Fonts*.cab" \
        "*/*".{ttf,ttc}

      echo "  - Cleaning up temporary files"
      rm $(echo "$_iso" | awk -F "/" '{print $NF}')
      rm -rf sources
    fi
  fi

  echo "- Verifying file integrity"
  for _i in ${!_allFiles[@]}; do
    echo -ne "  - ${_allFiles[$_i]}: "
    if [ ! -f ${_allFiles[$_i]} ]; then
      echo "MISSING"
      _fail=1
    elif [ "${_sha256sums[$_i]}" == "SKIP" ]; then
      echo "Skipped"
    elif [ "${_sha256sums[$_i]}" == "$(sha256sum ${_allFiles[$_i]} | cut -d' ' -f1)" ]; then
      echo "Pass"
    else
      echo "FAIL, expected ${_sha256sums[$_i]} but got $(sha256sum ${_allFiles[$_i]} | cut -d' ' -f1)"
      _fail=1
    fi
  done
  if [ $_fail ]; then
    echo "One or more files fail the integrity check or are missing. Exiting."
    exit 255
  fi
}

_package() {
    conflicts+=(${pkgname/11/8} ${pkgname/11/10} ttf-win7-fonts${pkgname##*11})

    install -Dm644 $@ -t "$pkgdir/usr/share/fonts/TTF"
}

package_ttf-ms-win11-fod-auto-hans() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (hans)'
    provides=(ttf-ms-win11-fod-hans)
    conflicts=(ttf-ms-win11-fod-hans)
    _package ${hans[@]}
}
package_ttf-ms-win11-fod-auto-guru() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (guru)'
    provides=(ttf-ms-win11-fod-guru)
    conflicts=(ttf-ms-win11-fod-guru)
    _package ${guru[@]}
}
package_ttf-ms-win11-fod-auto-gujr() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (gujr)'
    provides=(ttf-ms-win11-fod-gujr)
    conflicts=(ttf-ms-win11-fod-gujr)
    _package ${gujr[@]}
}
package_ttf-ms-win11-fod-auto-ethi() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (ethi)'
    provides=(ttf-ms-win11-fod-ethi)
    conflicts=(ttf-ms-win11-fod-ethi)
    _package ${ethi[@]}
}
package_ttf-ms-win11-fod-auto-deva() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (deva)'
    provides=(ttf-ms-win11-fod-deva)
    conflicts=(ttf-ms-win11-fod-deva)
    _package ${deva[@]}
}
package_ttf-ms-win11-fod-auto-cher() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (cher)'
    provides=(ttf-ms-win11-fod-cher)
    conflicts=(ttf-ms-win11-fod-cher)
    _package ${cher[@]}
}
package_ttf-ms-win11-fod-auto-cans() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (cans)'
    provides=(ttf-ms-win11-fod-cans)
    conflicts=(ttf-ms-win11-fod-cans)
    _package ${cans[@]}
}
package_ttf-ms-win11-fod-auto-beng() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (beng)'
    provides=(ttf-ms-win11-fod-beng)
    conflicts=(ttf-ms-win11-fod-beng)
    _package ${beng[@]}
}
package_ttf-ms-win11-fod-auto-arab() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (arab)'
    provides=(ttf-ms-win11-fod-arab)
    conflicts=(ttf-ms-win11-fod-arab)
    _package ${arab[@]}
}
package_ttf-ms-win11-fod-auto-thai() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (thai)'
    provides=(ttf-ms-win11-fod-thai)
    conflicts=(ttf-ms-win11-fod-thai)
    _package ${thai[@]}
}
package_ttf-ms-win11-fod-auto-telu() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (telu)'
    provides=(ttf-ms-win11-fod-telu)
    conflicts=(ttf-ms-win11-fod-telu)
    _package ${telu[@]}
}
package_ttf-ms-win11-fod-auto-taml() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (taml)'
    provides=(ttf-ms-win11-fod-taml)
    conflicts=(ttf-ms-win11-fod-taml)
    _package ${taml[@]}
}
package_ttf-ms-win11-fod-auto-syrc() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (syrc)'
    provides=(ttf-ms-win11-fod-syrc)
    conflicts=(ttf-ms-win11-fod-syrc)
    _package ${syrc[@]}
}
package_ttf-ms-win11-fod-auto-sinh() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (sinh)'
    provides=(ttf-ms-win11-fod-sinh)
    conflicts=(ttf-ms-win11-fod-sinh)
    _package ${sinh[@]}
}
package_ttf-ms-win11-fod-auto-paneuropean() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (paneuropean)'
    provides=(ttf-ms-win11-fod-paneuropean)
    conflicts=(ttf-ms-win11-fod-paneuropean)
    _package ${paneuropean[@]}
}
package_ttf-ms-win11-fod-auto-orya() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (orya)'
    provides=(ttf-ms-win11-fod-orya)
    conflicts=(ttf-ms-win11-fod-orya)
    _package ${orya[@]}
}
package_ttf-ms-win11-fod-auto-mlym() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (mlym)'
    provides=(ttf-ms-win11-fod-mlym)
    conflicts=(ttf-ms-win11-fod-mlym)
    _package ${mlym[@]}
}
package_ttf-ms-win11-fod-auto-laoo() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (laoo)'
    provides=(ttf-ms-win11-fod-laoo)
    conflicts=(ttf-ms-win11-fod-laoo)
    _package ${laoo[@]}
}
package_ttf-ms-win11-fod-auto-kore() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (kore)'
    provides=(ttf-ms-win11-fod-kore)
    conflicts=(ttf-ms-win11-fod-kore)
    _package ${kore[@]}
}
package_ttf-ms-win11-fod-auto-knda() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (knda)'
    provides=(ttf-ms-win11-fod-knda)
    conflicts=(ttf-ms-win11-fod-knda)
    _package ${knda[@]}
}
package_ttf-ms-win11-fod-auto-khmr() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (khmr)'
    provides=(ttf-ms-win11-fod-khmr)
    conflicts=(ttf-ms-win11-fod-khmr)
    _package ${khmr[@]}
}
package_ttf-ms-win11-fod-auto-jpan() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (jpan)'
    provides=(ttf-ms-win11-fod-jpan)
    conflicts=(ttf-ms-win11-fod-jpan)
    _package ${jpan[@]}
}
package_ttf-ms-win11-fod-auto-hebr() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (hebr)'
    provides=(ttf-ms-win11-fod-hebr)
    conflicts=(ttf-ms-win11-fod-hebr)
    _package ${hebr[@]}
}
package_ttf-ms-win11-fod-auto-hant() {
    pkgdesc='Microsoft Windows 11 TrueType FOD fonts (hant)'
    provides=(ttf-ms-win11-fod-hant)
    conflicts=(ttf-ms-win11-fod-hant)
    _package ${hant[@]}
}
