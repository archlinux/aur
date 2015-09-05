# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

# This is a very basic package for installing the fonts provided with Windows
# 10. There are much more fancy packages available in the AUR for win7, win8
# and office fonts. If any of those maintainers want to tweak this package
# accordingly, I will happily give them permissions to do so.

# Instructions were copied from ttf-ms-win8 and slightly modified:
#
# BUILD INSTRUCTIONS:
# -------------------
#
# Please note, that usage of Microsoft fonts outside running Windows
# system is prohibited by EULA (although in certain countries EULA is invalid).
# Please consult Microsoft license before using fonts.
#
# You can acquire fonts either from an installed Windows 10 system
# or install medium.
#
# On the installed Windows 10 system fonts are usually located in
#       C:\Windows\Fonts
# and license file is
#       C:\Windows\System32\license.rtf
#
# How to acquire fonts from Windows 10 install medium:
#
#    You can freely download the Windows 10 Enterprise 90-day evaluation from:
#
#       http://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise
#
#    Fonts are located in 'sources/install.wim' file on the ISO, which
#    is a 'Windows Imaging Format' (WIM) archive.
#
#    You can extract WIM using wimextract ('wimlib' package from AUR) or
#    7z ('p7zip').
#
#    Put the following script together with previously extracted
#    'install.wim' and execute:
#
#       wimextract install.wim 1 /Windows/{Fonts/"*".{ttf,ttc},System32/license.rtf} --dest-dir fonts
#
#    Fonts and license will be located in the 'fonts' dir.
#
# You need the files listed in the source=() array. Place them in the same
# directory as this PKGBUILD file, then run makepkg.


pkgname=ttf-ms-win10
pkgver=10.0.10240
pkgrel=2
pkgdesc="Microsoft Windows 10 TrueType fonts"
arch=('any')
url='http://www.microsoft.com/typography/fonts/product.aspx?PID=164'
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontscale' 'xorg-mkfontdir')
provides=(ttf-font ttf-tahoma ttf-{ms,vista,win7}-fonts ttf-ms-win8{,-arabic,-hebrew,-indic,-japanese,-korean,-other,-sea,-thai,-zh_cn,-zh_tw})
conflicts=(ttf-tahoma ttf-{ms,vista,win7}-fonts ttf-ms-win8{,-arabic,-hebrew,-indic,-japanese,-korean,-other,-sea,-thai,-zh_cn,-zh_tw})
install="${pkgname}.install"

_fonts=(
	arialbd.ttf
	arialbi.ttf
	ariali.ttf
	arial.ttf
	ariblk.ttf
	calibrib.ttf
	calibrii.ttf
	calibrili.ttf
	calibril.ttf
	calibri.ttf
	calibriz.ttf
	cambriab.ttf
	cambriai.ttf
	cambria.ttc
	cambriaz.ttf
	Candarab.ttf
	Candarai.ttf
	Candara.ttf
	Candaraz.ttf
	comicbd.ttf
	comici.ttf
	comic.ttf
	comicz.ttf
	consolab.ttf
	consolai.ttf
	consola.ttf
	consolaz.ttf
	constanb.ttf
	constani.ttf
	constan.ttf
	constanz.ttf
	corbelb.ttf
	corbeli.ttf
	corbel.ttf
	corbelz.ttf
	courbd.ttf
	courbi.ttf
	couri.ttf
	cour.ttf
	ebrimabd.ttf
	ebrima.ttf
	framdit.ttf
	framd.ttf
	Gabriola.ttf
	gadugib.ttf
	gadugi.ttf
	georgiab.ttf
	georgiai.ttf
	georgia.ttf
	georgiaz.ttf
	himalaya.ttf
	impact.ttf
	javatext.ttf
	l_10646.ttf
	LeelaUIb.ttf
	LeelawUI.ttf
	LeelUIsl.ttf
	lucon.ttf
	malgunbd.ttf
	malgunsl.ttf
	malgun.ttf
	marlett.ttf
	micross.ttf
	mingliub.ttc
	mmrtextb.ttf
	mmrtext.ttf
	monbaiti.ttf
	msjhbd.ttc
	msjhl.ttc
	msjh.ttc
	msyhbd.ttc
	msyhl.ttc
	msyh.ttc
	msyi.ttf
	mvboli.ttf
	NirmalaB.ttf
	NirmalaS.ttf
	Nirmala.ttf
	ntailub.ttf
	ntailu.ttf
	palabi.ttf
	palab.ttf
	palai.ttf
	pala.ttf
	phagspab.ttf
	phagspa.ttf
	segmdl2.ttf
	segoeprb.ttf
	segoepr.ttf
	segoescb.ttf
	segoesc.ttf
	segoeuib.ttf
	segoeuii.ttf
	segoeuil.ttf
	segoeuisl.ttf
	segoeui.ttf
	segoeuiz.ttf
	seguibli.ttf
	seguibl.ttf
	seguiemj.ttf
	seguihis.ttf
	seguili.ttf
	seguisbi.ttf
	seguisb.ttf
	seguisli.ttf
	seguisym.ttf
	simsunb.ttf
	simsun.ttc
	SitkaB.ttc
	SitkaI.ttc
	Sitka.ttc
	SitkaZ.ttc
	sylfaen.ttf
	symbol.ttf
	tahomabd.ttf
	tahoma.ttf
	taileb.ttf
	taile.ttf
	timesbd.ttf
	timesbi.ttf
	timesi.ttf
	times.ttf
	trebucbd.ttf
	trebucbi.ttf
	trebucit.ttf
	trebuc.ttf
	verdanab.ttf
	verdanai.ttf
	verdana.ttf
	verdanaz.ttf
	webdings.ttf
	wingding.ttf
	YuGothB.ttc
	YuGothL.ttc
	YuGothM.ttc
	YuGothR.ttc
)

source=("${_fonts[@]}" license.rtf)

package() {
	mkdir -p "${pkgdir}/usr/share/fonts/TTF"

	for font in "${_fonts[@]}"; do
		install -m644 "$font" "${pkgdir}/usr/share/fonts/TTF"
	done

	install -Dm644 license.rtf -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('61daedc4107c937e66911b8184688601ac70f9c27f19d069c3b38f892fa314e4'
            '3e1b042729be1d73f6c4071482b06c0ff16a031d5f9ebda861fe5e3d1293573a'
            '7645ce18dc998e1280590f2ecce73d5ea0f4944229d4595a38b699ee88f4f102'
            '95766b58f7d869b0fa2cf6e6feb26c1b21cdf2631f1c5863fc9bd206d5c6e8ee'
            '7bff8efabe06bb665d168a1b063c1ae56e3edc058106adb1d8ec5f582f357174'
            '0d53ac794d43899fb096f6e871cfdddb0885e5ff9c39052877d03bec2757b175'
            '3182dadc0816e11f11d09b83b5fdf72b94cb1573ef20e105cc3fd51beb067cf0'
            'f315f9a6fe154c05608a059d1b22d7b3160e574b4f84cd3eccef695a3ca21f05'
            '162c6a27b253e5a65e0b509d8b76c5d74be1c70871ad831228e65e181daa8e76'
            '72af985bf4cd4580882682a9b0e62b281e3668984f9b76d562525a5a30abfc7e'
            'f8e6090befa4d5b9a6cfb82c12f5cb33b545aff587123c3bfe80ba56853681bd'
            '3d77eb209be61eb56faca225e6b5c7f47f3f5e3a9e773671bb9d988f9fa36410'
            '488bee9b7c21647d50576852524ecc7e5df66fd742aa4f02478f7f232a369a0d'
            'ac06c0cf6837515d67301d927d844edf1c93c01357cccfc157b5e7c20bcee096'
            '9832e8ff1f087a6c54b4f2062de1b348c2e09939a7d0c5deea5ea4bd72b82c54'
            'f959e0709a770094814199e49b0441b13e2bb075475b7ed2125ead7841ff2215'
            'da786a0df49cd2f45a9a8dc67120ec534e4624bf168829947bb08c4f937c21ad'
            'f4cc0c11780a2d94cd6b74ed54fa657f26677013028c956ecb40da81c6b59b9e'
            'c2017a26bbd51775376baa93ba63095ba90a955c0eb93bbe44b9e73e0958fd73'
            'f13a7e4419f5e9d9b8efb2c436675f66607bf98e2d596b8c296d7b250f4c877b'
            '04bc106970b51bf365ac2d6f7c88d4171f489e512f42229d39a0fd375ca0f956'
            '1300142c0886fca1155689241d1f6a3c6c6d3cb9c292e7a47db7e6417401ddee'
            'c301881da0894256a919e819b944f1cad7eea8060330ff1a48acacd6323fd4b2'
            '73acf8f7f9d16c76829ee5ee801852cd54184a68ac513c1e339487685aa9b732'
            'e291bf0633020c09cf81af848d7ff97ac342a025d1e6676c3a50d62663f0b6b3'
            'aa5c97b9107bcfd72e29174df51b0cfb12a0fecbcd04f5518829dea8d0c19187'
            '0000adf3cc6f3f382b061f31277cdcb3787fb816d7251d8fdb57b33085eaab70'
            '11a7a1c6b1b4028cd7e55f60a9773ecc7d39b66b8f82f5b7c6fbf8a4fdfcf94e'
            'be0306e2040aeeed8bf228524071f4b941d28cbdd3ff413a9db07d1da9213ec9'
            'cbe6c682f09b600d45f614be798a096c2a784c568020319e6168eec3f0619dc0'
            '6bf361ae27d2f67e05d9ad0fa6e0bc4e16c2ada6926d6c24b557e2547f4f242e'
            '2d3fb4d471e9669a5ab2bc8aa9b359639e17af321510f3b878bae03bc259b056'
            '7e9cd651666dce6dd3ad37b8199c7798b226b8995d35e6b672b53ce0bbec59cb'
            '83f5b36107f7ea50fd5c52b1c3e8d64de3edc5d0f2c2e2e9f634fbbcfd7abd74'
            '9c68522951940ad49354f4fce56b528414a7e83c44474ceea0582a5434693066'
            '48aa67a7e051b3b01971d23cde77a7712dd0ef17b46a76db3f560c3b12e51215'
            'd9046a0be729b2a547555df405517545dd2ea4930d67d578013166f0fbfacfd0'
            'b707a469f233edff709f51e7bcba2e69f1f52460d8ee2d510707a7cac103b498'
            'd4557f9674de7c5ef58ad4c3651016944672c6bf1f5e9253abfeea9730939808'
            '4be83a5bc229b50e3f18a071a2a3d09a408e9d6a807869b2a93645a40f45bb89'
            '6d5d530326ce286f1afee0b71a6f2e4f4930e5bb99967710b6a9634e482e0ef2'
            '68f1597a57a071f291449e66c888c1b86ad617d8eb18da52c7c2dbdf781ddc2f'
            '2d648599fc7acacb024ab08a0720a62e2f2cc070ff19582eb9b5c824e1515ecb'
            '29eaa6d65d0f1508d2d550d5ddf4e7e3a4e23cf13b376ff93140a8a6115b2f82'
            'cf392fef1d5688c2b81059219494f574728bb830e7da093c3274afb9702ae8f9'
            'd6fbfa966797c79844ca5fecf11dcd341544fdf76947d291133f079a3dac2e4c'
            '4e58ccaf7f117d138a0996c986d24d7adf9afc801b581ce58887e25cf044f113'
            'b16db0eade36cba0a5e699310c34efa38850f74a109d9865455179d9ab1cedc2'
            'a397369e610f01893fe888c3911f407861baf6f86e42c17816443dba6072e64e'
            'c7028fd58bef5821f560ad69d710b4554395c771788ac22637345a5fc425eb53'
            '4cd4f18769d3ac768f54bd77e449d3f2abb94960bfb8cb9be296fd834f340178'
            'f93975b19a5d23890387f910786c7c7d4e91aeeb134690f1ea64278fa73f9371'
            'e7fabbb6bfae0697600cccd1cd87a4d43adad5aa0286d593ff4366681e2a60c7'
            'b9ed2bf08381f8b763673504d82b27c6e029156c73cede54e551e59fe8e940da'
            'bea454159291632db58c89a2c0b749f7606c178bd3f4d7193645792c5d557400'
            'b8bfacc2007fb364281a2d1fe4942971120fc106ce4c01cbea20cfe7f0e376f2'
            '79345f1db8f57a67b58a83ecdd45932b0bbed6f2b757d124fe0207ca2eae6ca4'
            'f4df4d6d1a69d24e08da2ad2f45203b4c7147ddaa5187ccd73087903ca36d177'
            '3a2ac5b511ae1a8f509be0f0831d22f5fd4d1fb407db73f9633fe2eca95259be'
            '21b1574e3ede2512a7afbc527a8bb31a83926267d348025a3ee4f18642e7ada7'
            'bb4d44d1039448379bf2cc651145cd42eb0be40dffcce31897158f615bb8c8bb'
            '511db37f04906eb2e77a91949edb04a61ce9838e9523011621dff4971a8d5867'
            '66d94ccdd797ceedca370fdcda36a418266012ebde73ae8cfa6419fb80914bd1'
            'bcd2ece54c61f5e20db1b2f60b4215274b3f9a92deba89e7b3f41085e1a31abb'
            '882d0e800dec2ff49cf42595bb07eb815e70befbb618eef232dcd15af7e279e7'
            '1dafb0e3ac2dcb2eb20e7daab0a0c87eba2c74d3b0ea39df0056be0e995d824c'
            '456fbb8858e64737feaa868f535dada4b6d7763d5efbe4255476ac5c4e2a1a9e'
            '41b9694a9335140a7fb6b6e53bf41d51e281bb2cee51053f98773cf18637378e'
            'eb9061bf0e2995da8a1148fea3afb73851804d0a09bc5fe8ac6d11b87f4c3d89'
            'fe03477f86a344aee44688dcc13f883a2577160fa272c00dc21c9cb3f5b3239e'
            '48262d62fa676d54892b1f1bab01d688a05f9ac57c814f0a89fc6817d3dee8ee'
            '18ec29ada89a380a3e044fcce1148cbae8fd39cc2755c8070acabc0d41029c9c'
            '30ffd28943538a1bd218b3867939a5ca3161d49e5ce87a452a63a22f2ea8a630'
            '50107f7f089481ef9a62c5f20e48eea21bb3f54cdc416c53288345c62c43d24d'
            '90aa8461b7d61e350495584e0ffcc3a5a3168048605e14b2fedb193b38012962'
            'ca950c682dd753c726091025600f3c7f94760c83fef3ef0845a61035ee5a70cb'
            'a47b5bc40891d39189dcb28c6eb297f6104770dc447b57c5e21fd6182910ee2a'
            'a4d3594f888ab0bf446870433dbca3485a7a860a0eb48a0fc85b567645ac0cfe'
            '1a835b8d3d56bd3e0fbb61a39e2074516e6c54ae4b49caa00922c42a5c812c73'
            'f57971d9387e0b762a29c8826dc39717b1a191ab3933d21e171da9b75d510792'
            '1ec4e73e81f09fe867bb1e3a61496ac1eec382b53395ebf6b71b5c268a210f73'
            '66a97fa5d1afa922772377b68fc6a8c18eb11a9972a76da2aee6920c1e5b0bbf'
            'ffce42ca79bc15e453241e00a07bad6d4b1b1c1929a17a546b18602c999137e2'
            '2e03ecf35b3643c33ec0d68488f24b1caebed6fe7b40706603e6ca5a4fcfb9e1'
            '2c61b719ebc6b73715fd295e76c99c8b23ce10e1d2f1985c2de355f6959002cb'
            '01599994969eb9d99699a6c4d0108e5dc1b8a671f2c1150a7810d0adbbd61f8c'
            '81faba2ce3a731229f1cb66449e04c729fae1b7eca1b8e041df917cb7186d754'
            'f1b950b4ffbcd71c581ecdaea184b789e1dbbc43da6391c790c096812b20f769'
            'ecf3f898c2970377f7853ff7d7dd973e069bb8fd6264a36c01fff56ee28af701'
            'abf76b314ca2432ab718a74a4028bb7707073cb0d50643547c59f41a540b66a5'
            '8f6328619340426b2c985f6fd305bb64d164b20b20a5b493a21533761bd5d631'
            '9b64c9988af89d510e050b94cdc2e49fbdf5c1e9c18835b5ddd127a4ccfdf6dd'
            '96773b40f779b9e9c3236ccdfe7297a67b4ba509270c97ee691a5690483277cc'
            'dca7eb0b9682485f927d7e705682f54a5f78deb06a82bec3b96da2e575dc9118'
            '9292916ee053cca41df8616fa3e96cf0ab10ea169f26244d65e864b9610ba31c'
            '5f2331a860c6bef0945e85c610dcdd10573b7c7aa348fa1ca3c5fa8dff4b0e15'
            'b311ff9901fc3e00d7cbfb552634bd3839a6aceb1beaf8c9c74dc9619d3551f2'
            '99af6bcc95341bb123b40ae3a5ba5d1cbc8957dedfbe82cc6a80a02c08dfd86d'
            '4098759bea7de30a5d9d38f90e8d0efd1d2fbba59046d35bf37269d717fa775c'
            'fe6931430747f8f7927952b74caec56f864291168ae466eb6252f41da10ebcd4'
            '281d18627eafa6de4a31bfe2d4bed74ec20cd7f631e5a849930cc10b53f883b9'
            'c10e49baf002048b4293ba10ceac13cc1a029cbd9051dd1dc0f8deb0d78beba7'
            '6f1d2d4526e69290136b46a9b679ce2c981cd48fabbe80c9013e78f9b7c26786'
            '1646aa392b1986df07fd9e6b34fefdcdbbbfcb39dba25ce9a6c96761dcb4f153'
            '033765649c7e28981ce31bbf3538e50f0a068ca871c23347a94fe4f7fcf37818'
            '5822500a2b7659b076aa340e9e13c3ea651682d9dbebef3f60e3d656a996048b'
            'e414ce2cb5a62cef00cf184f7dbad32975a1db384f05e92dc5a9cad6a36d561a'
            '5759184fb477d80860862e4d9cc38f415c637136fef970269ec6088295edd5e5'
            'bd87d32c318ed103dd7e442baf6f58ccff3c757dab06e016918d821362c7feb3'
            'bedd8106542fc2c92df882e872ce97292617a37b4dc8b6b53a35ce41b9eac0b8'
            '299f52434e98c9e437eeae1c8f9348ce4118e30cf6c70aec5759c69460eaca67'
            '00e3e3d43f72337c8e81e49ded3ee6b1568f924bbe54a9cf6f14a38f6b9cdfde'
            '64f128fa9a40b4cd0feb37632348b6bb64535af121142ab1c6bcd7d91cb1fb06'
            'bffdc2fd675d9af414824ae84d8456504542480afb34fbc6bfd6903656c4f854'
            '4ddb7650932df3b12327ac6533c66708c99f091189d76b319ef6ecc8b26cbc0d'
            '3a326f6be0dd90d1983e2dedec69857eaa876e9a4ff1074796744b3c07d3f21c'
            'ff34c98245769ac36546c9f8dfd7ae7b42b38560910bdf5fdeb75a90a60d8037'
            'c4236f6b63fbb7cea53976ef908384925c6606177e8ed211d506466e166d8050'
            'f05eadb4f753e9a1a3bd5d9aac5d0ea503d8000988f9715634c9f93baaf2c395'
            '73d8012b9dc0f531e7f18c62c61f9a602b41baefa65fe54b3b45ac923ee5dbe2'
            '115d6e3283508911e303a1d2e72e2ada77c3a0be14d8d61877506c765e285a59'
            'bd03fb7335c725148e192765164dd6efdb6841fd9fc889fcb3b573f00a316193'
            '04c12ee2fdad4079bff1a5c52a5571401608f6968b3d4c4838f967ac7e351750'
            'b7a2604eebac664bc50461b94b6d26ed2bd7e39ac365ad25483ab867d0e1e9b1'
            '6a04b204e22043c70bf8fdf087bc44a73ff3f225da141847588fc5ca885786c9'
            '55ce2a374c7f126ac4b62d521183d210dc05cc0705d3047889b693181bd557e6'
            '174568c4633a8a688d579d283f7508c16e437434fd5ac97d4ce30dfc42d0860b'
            '377be5cc51493f716c6aa89f539c532f78fc0b39c7ddd6c708a2dac345cda93b'
            'bbd6f974d877a53b320410529ff1e9295148b3bac5a14029910adac1607a77eb'
            '2c5aa27b62da26f432406852303acad6fdc9121b73f468c75fae33ade799ea81'
            '1161ce511c44eb5464a4f8144aaf3eb965a50ed66957ad7d38e497ab9d958e5a'
            'd7c38355bd52f52e043ed904f3463d476925300d1bdca9e842b28077ca3549b8'
            '9107c1a405f3647f0696558f83b60369058dcabdeb8c718625c67ed5e16f1969'
            '4d06367d3e27d90195ba16b69ed86b8e0e190d5eab9697748b708f16273e3365'
            '1d3848165ad00b4d9be26c69186a405cb4cc9a372d51cc74f76abf7afc705a57'
            '324452829ee14f4c4500653923835ac3de7758f336ed3bf1142522bfede688d3'
            SKIP)
